import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:sub_bagussh/presentation/bloc/tv/details/tv_detail_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/recommend/tv_recommend_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/watchlist/tv_watchlist_bloc.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';

import 'package:sub_bagussh/common/constants.dart';
import 'package:sub_bagussh/domain/entities/genre.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      context
            .read<TvDetailBloc>()
            .add(GetTvDetailEvent(widget.id));
        context
            .read<TvRecommendationBloc>()
            .add(GetTvRecommendationEvent(widget.id));
        context
            .read<TvWatchlistBloc>()
            .add(GetStatusTvEvent(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) { 
    TvRecommendationState tvRecommendations =
        context.watch<TvRecommendationBloc>().state;
    return Scaffold(
      body: BlocListener<TvWatchlistBloc, TvWatchlistState>(
      listener: (_, state) {
        if (state is TvWatchlistSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
          context
              .read<TvWatchlistBloc>()
              .add(GetStatusTvEvent(widget.id));
        }
      },
      child: BlocBuilder<TvDetailBloc, TvDetailState>(
        builder: (context, state) {
          if (state is TvDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvDetailLoaded) {
            final tv = state.tvDetail;
            bool isAddedToWatchlistTv = (context.watch<TvWatchlistBloc>().state
                    is TvWatchlistStatusLoaded)
                ? (context.read<TvWatchlistBloc>().state
                        as TvWatchlistStatusLoaded)
                    .result
                : false;
            return SafeArea(
              child: DetailContent(
                tv,
                tvRecommendations is TvRecommendationLoaded
                              ? tvRecommendations.tv
                              : List.empty(),
                isAddedToWatchlistTv,
              ),
            );
          } else {
            return Text("Empty");
          }
        },
      ),
    ),);
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
                                  BlocProvider.of<TvWatchlistBloc>(context)
                                    ..add(AddItemTvEvent(tv));
                                } else {
                                  BlocProvider.of<TvWatchlistBloc>(context)
                                    ..add(RemoveItemTvEvent(tv));
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
                            BlocBuilder<TvRecommendationBloc,
                                TvRecommendationState>(
                              builder: (context, state) {
                                if (state is TvRecommendationLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is TvRecommendationError) {
                                  return Text(state.message);
                                } else if (state is TvRecommendationLoaded) {
                                  final recommendations = state.tv;
                                  if (recommendations.isEmpty) {
                                    return const Text("No tv recommendations");
                                  }
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