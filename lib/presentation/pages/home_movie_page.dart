import 'package:sub_bagussh/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/presentation/pages/about_page.dart';
import 'package:sub_bagussh/presentation/pages/home_tvclil_page.dart';
import 'package:sub_bagussh/presentation/pages/movie_detail_page.dart';
import 'package:sub_bagussh/presentation/pages/popular_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/search_page.dart';
import 'package:sub_bagussh/presentation/pages/top_rated_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/watchlist_movies_page.dart';
import 'package:sub_bagussh/presentation/pages/watchlist_tvclil_page.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
  static const ROUTE_NAME = '/home';
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<MovieNowPlayingBloc>().add(MovieNowPlayingGetEvent());
      context.read<MoviePopularBloc>().add(MoviePopularGetEvent());
      context.read<MovieTopRatedBloc>().add(MovieTopRatedGetEvent());
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
              accountName: 
              Text('ditonton'),
              accountEmail: 
              Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text
              ('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text
              ('TV'),
              onTap: () {
                Navigator.pushNamed(context, HomeTvclilPage.ROUTE_NAME);
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
                  ('Movies'),
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
        ('Movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
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
              BlocBuilder<MoviePopularBloc, MoviePopularState>(
              builder: (context, state) {
                if (state is MoviePopularLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MoviePopularLoaded) {
                  return MovieList(state.result);
                } else if (state is MoviePopularError) {
                  return Text(state.message);
                } else {
                  return const Text('Failed');
                }
              },
            ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<MovieTopRatedBloc, MovieTopRatedState>(
              builder: (context, state) {
                if (state is MovieTopRatedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieTopRatedLoaded) {
                  return MovieList(state.result);
                } else if (state is MovieTopRatedError) {
                  return Text(state.message);
                } else {
                  return const Text('Failed');
                }
              },
            ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<MovieTopRatedBloc, MovieTopRatedState>(
              builder: (context, state) {
                if (state is MovieTopRatedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieTopRatedLoaded) {
                  return MovieList(state.result);
                } else if (state is MovieTopRatedError) {
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
              children: [Text('More Movies'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}