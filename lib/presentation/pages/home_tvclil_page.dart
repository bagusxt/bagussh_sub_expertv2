import 'package:sub_bagussh/common/constants.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/presentation/pages/about_page.dart';
import 'package:sub_bagussh/presentation/pages/home_movie_page.dart';
import 'package:sub_bagussh/presentation/pages/popular_tvclil_page.dart';
import 'package:sub_bagussh/presentation/pages/search_page_tvclil.dart';
import 'package:sub_bagussh/presentation/pages/top_rated_tvclil_page.dart';
import 'package:sub_bagussh/presentation/pages/tvclil_detail_page.dart';
import 'package:sub_bagussh/presentation/pages/watchlist_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/watchlist_tvclil_page.dart';

import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTvclilPage extends StatefulWidget {
  @override
  _HomeTvclilPageState createState() => _HomeTvclilPageState();
  static const ROUTE_NAME = '/tv';
}

class _HomeTvclilPageState extends State<HomeTvclilPage> {
  @override
  void initState() {
    Future.microtask((){
      context.read<TvOnAirBloc>().add(TvOnAirGetEvent());
      context.read<TvPopularBloc>().add(TvPopularGetEvent());
      context.read<TvTopRatedBloc>().add(TvTopRatedGetEvent());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage
                ('assets/circle-g.png'),
              ),
              accountName: Text
              ('ditonton'),
              accountEmail: Text
              ('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text
              ('Movies'),
              onTap: () {
                Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text
              ('TV'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: Text
              ('My Watchlist'),
              leading: Icon(Icons.save_alt),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.movie),
                  title: Text
                  ('Movie'),
                  onTap: () {
                    Navigator.pushNamed(
                        context, WatchlistMoviesPage.ROUTE_NAME);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.tv),
                  title: Text
                  ('TV'),
                  onTap: () {
                    Navigator.pushNamed(
                        context, WatchlistTvclilPage.ROUTE_NAME);
                  },
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text
              ('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text
        ('TV'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTvclilPage.ROUTE_NAME);
            },
             icon: Icon(Icons.search),
           )
        ],
      ),
        //  IconButton(
        //  onPressed: () {
        //  FirebaseCrashlytics.instance.crash();
        //  Navigator.pushNamed(context,SearchTvclilPage.ROUTE_NAME);
        // },
        // )
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
               BlocBuilder<TvOnAirBloc, TvOnAirState>(
              builder: (context, state) {
                if (state is TvOnAirLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvOnAirLoaded) {
                  return TvList(state.result);
                } else if (state is TvOnAirError) {
                  return Text(state.message);
                } else {
                  return const Text('Failed');
                }
              },
            ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(
                    context, PopularTvclilPage.ROUTE_NAME),
              ),
             BlocBuilder<TvPopularBloc, TvPopularState>(
              builder: (context, state) {
                if (state is TvPopularLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvPopularLoaded) {
                  return TvList(state.result);
                } else if (state is TvPopularError) {
                  return Text(state.message);
                } else {
                  return const Text('Failed');
                }
              },
            ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                    context, TopRatedTvclilPage.ROUTE_NAME),
              ),
               BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
              builder: (context, state) {
                if (state is TvTopRatedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvTopRatedLoaded) {
                  return TvList(state.result);
                } else if (state is TvTopRatedError) {
                  return Text(state.message);
                } else {
                  return const Text('Failed');
                }
              },
            ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('More TV Series'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tvclil> tv;

  TvList(this.tv);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvs = tv[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvclilDetailPage.ROUTE_NAME,
                  arguments: tvs.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvs.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tv.length,
      ),
    );
  }
}