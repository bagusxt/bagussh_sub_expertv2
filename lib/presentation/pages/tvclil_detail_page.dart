import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/tvclil_detail_notifier.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/common/constants.dart';
import 'package:sub_bagussh/domain/entities/genre.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TvclilDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv';

  final int id;
  TvclilDetailPage({required this.id});

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvclilDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TvclilDetailNotifier>
      (context, listen: false)
          .fetchTvDetail(widget.id);
      Provider.of<TvclilDetailNotifier>(
        context, listen: false)
          .loadWatchlistStatusTv(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TvclilDetailNotifier>(
        builder: 
        (context, provider, child) {
          if 
          (provider.tvState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if 
          (provider.tvState == RequestState.Loaded) {
            final tv = provider.tv;
            return SafeArea(
              child: DetailContent(
                tv,
                provider.tvRecommendations,
                provider.isAddedToWatchlistTv,
              ),
            );
          } else {
            return Text(provider.message);
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvclilDetail tv;
  final List<Tvclil> recommendations;
  final bool isAddedWatchlistTv;

  DetailContent
  (this.tv, this.recommendations, this.isAddedWatchlistTv);

  @override
  Widget build
  (BuildContext context) {
    final screenWidth 
    = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 
          'https://image.tmdb.org/t/p/w500${tv.posterPath}',
          width: screenWidth,
          placeholder: 
          (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: 
          (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only
          (top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: 
            (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tv.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedWatchlistTv) {
                                  await Provider.of
                                  <TvclilDetailNotifier>(
                                      context,
                                      listen: false)
                                      .addWatchlistTv(tv);
                                } else {
                                  await Provider.of
                                  <TvclilDetailNotifier>(
                                      context,
                                      listen: false)
                                      .removeFromWatchlistTv(tv);
                                }

                                final message =
                                    Provider.of<TvclilDetailNotifier>(context,
                                        listen: false)
                                        .watchlistMessageTv;

                                if (message ==
                                    TvclilDetailNotifier
                                        .watchlistAddSuccessMessage ||
                                    message ==
                                        TvclilDetailNotifier
                                            .watchlistRemoveSuccessMessage) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlistTv
                                      ? Icon(Icons.check)
                                      : Icon(Icons.add),
                                  Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(tv.genres),
                            ),
                            Text(
                              (tv.firstAirDate),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tv.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tv.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tv.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            Consumer<TvclilDetailNotifier>(
                              builder: (context, data, child) {
                                if (data.recommendationTvState ==
                                    RequestState.Loading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (data.recommendationTvState ==
                                    RequestState.Error) {
                                  return Text(data.message);
                                } else if (data.recommendationTvState ==
                                    RequestState.Loaded) {
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tv = recommendations[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvclilDetailPage.ROUTE_NAME,
                                                arguments: tv.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                                                placeholder: (context, url) =>
                                                    Center(
                                                      child:
                                                      CircularProgressIndicator(),
                                                    ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                    Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop
                (context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres
  (List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty)
    {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}