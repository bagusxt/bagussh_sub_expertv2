import 'package:sub_bagussh/data/datasources/db/database_helper.dart';
import 'package:sub_bagussh/data/datasources/db/database_helper_tvclil.dart';
import 'package:sub_bagussh/data/datasources/movie/movie_local_data_source.dart';
import 'package:sub_bagussh/data/datasources/movie/movie_remote_data_source.dart';
import 'package:sub_bagussh/data/datasources/tvclil/tvclil_local_data_source.dart';
import 'package:sub_bagussh/data/datasources/tvclil/tvclil_remote_data_source.dart';
import 'package:sub_bagussh/data/repositories/movie_repository_impl.dart';
import 'package:sub_bagussh/data/repositories/tvclil_repository_impl.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';
import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_movie_detail.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_popular_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_watchlist_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_watchlist_status.dart';
import 'package:sub_bagussh/domain/usecases/movies/remove_watchlist.dart';
import 'package:sub_bagussh/domain/usecases/movies/save_watchlist.dart';
import 'package:sub_bagussh/domain/usecases/movies/search_movies.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_now_playing_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_popluar_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_detail.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_recomendations.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_status_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/remove_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/save_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/search_tvclil.dart';
import 'package:sub_bagussh/presentation/provider/movies/movie_detail_notifier.dart';
import 'package:sub_bagussh/presentation/provider/movies/movie_list_notifier.dart';
import 'package:sub_bagussh/presentation/provider/movies/movie_search_notifier.dart';
import 'package:sub_bagussh/presentation/provider/movies/popular_movies_notifier.dart';
import 'package:sub_bagussh/presentation/provider/movies/top_rated_movies_notifier.dart';
import 'package:sub_bagussh/presentation/provider/movies/watchlist_movie_notifier.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/popular_tvclil_notifier.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/top_rated_tvclil_notifier.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/tvclil_detail_notifier.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/tvclil_list_notifier.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/tvclil_search_notifier.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/watchlist_tvclil_notifier.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
        () => MovieListNotifier(
      getNowPlayingMovies: 
      locator(),
      getPopularMovies: 
      locator(),
      getTopRatedMovies: 
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvclilListNotifier(
      getNowPlayingTvclil: 
      locator(),
      getPopularTvclil: 
      locator(),
      getTopRatedTvclil: 
      locator(),
    ),
  );
  locator.registerFactory(
        () => MovieDetailNotifier(
      getMovieDetail: 
      locator(),
      getMovieRecommendations: 
      locator(),
      getWatchListStatus: 
      locator(),
      saveWatchlist: 
      locator(),
      removeWatchlist: 
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvclilDetailNotifier(
      getTvclilDetail: 
      locator(),
      getTvclilRecommendations: 
      locator(),
      getWatchListStatusTvclil: 
      locator(),
      saveWatchlistTvclil: 
      locator(),
      removeWatchlistTvclil: 
      locator(),
    ),
  );
  locator.registerFactory(
        () => MovieSearchNotifier(
      searchMovies: 
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvclilSearchNotifier(
      searchTv: locator(),
    ),
  );
  locator.registerFactory(
        () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
        () => PopularTvclilNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
        () => TopRatedTvclilNotifier(
      getTopRatedTv: locator(),
    ),
  );
  locator.registerFactory(
        () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
        () => WatchlistTvclilNotifier(
      getWatchlistTv: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() 
  => GetNowPlayingMovies(locator()));

  locator.registerLazySingleton(()
   => GetPopularMovies(locator()));

  locator.registerLazySingleton(()
   => GetTopRatedMovies(locator()));

  locator.registerLazySingleton(() 
   => GetMovieDetail(locator()));

  locator.registerLazySingleton(() 
  => GetMovieRecommendations(locator()));

  locator.registerLazySingleton(() 
  => SearchMovies(locator()));

  locator.registerLazySingleton(() 
  => GetWatchListStatus(locator()));

  locator.registerLazySingleton(() 
  => SaveWatchlist(locator()));

  locator.registerLazySingleton(() 
  => RemoveWatchlist(locator()));

  locator.registerLazySingleton(() 
  => GetWatchlistMovies(locator()));


  locator.registerLazySingleton(() 
  => GetNowPlayingTvclil(locator()));

  locator.registerLazySingleton(() 
  => GetPopularTvclil(locator()));

  locator.registerLazySingleton(() 
  => GetTopRatedTvclil(locator()));

  locator.registerLazySingleton(() 
  => GetTvclilDetail(locator()));

  locator.registerLazySingleton(() 
  => GetTvclilRecommendations(locator()));

  locator.registerLazySingleton(() 
  => SearchTvclil(locator()));

  locator.registerLazySingleton(() 
  => GetWatchListStatusTvclil(locator()));

  locator.registerLazySingleton(() 
  => SaveWatchlistTvclil(locator()));

  locator.registerLazySingleton(() 
  => RemoveWatchlistTvclil(locator()));

  locator.registerLazySingleton(() 
  => GetWatchlistTvclil(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvclilRepository>(
        () => TvclilRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TvclilRemoteDataSource>(
          () => TvclilRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvclilLocalDataSource>(
          () => TvclilLocalDataSourceImpl(databaseHelpertvclil: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<DatabaseHelperTvclil>(() => DatabaseHelperTvclil());

  // external
  locator.registerLazySingleton(() => http.Client());
}