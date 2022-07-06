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
import 'package:sub_bagussh/presentation/bloc/movie/movie_detail/movie_detail_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/now_play/movie_now_play_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/populares/movie_popular_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/recommend/movie_recommend_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_search/movie_search_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/top_rated/movie_top_rated_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/details/tv_detail_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/now_air/tv_now_air_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/populares/tv_popular_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/recommend/tv_recommend_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/search/tv_search_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/top_rate/tv_top_rate_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/watchlist/tv_watchlist_bloc.dart';
import 'package:get_it/get_it.dart';


import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => MovieDetailBloc(
        getMovieDetail: locator(),
      ));
  locator.registerFactory(
    () => MovieNowPlayingBloc(locator()),
  );
  locator.registerFactory(
    () => MoviePopularBloc(locator()),
  );
  locator.registerFactory(() => MovieRecommendationBloc(
        getMovieRecommendations: locator(),
      ));
  locator.registerFactory(() => MovieSearchBloc(
        searchMovies: locator(),
      ));
  locator.registerFactory(
    () => MovieTopRatedBloc(locator()),
  );
  locator.registerFactory(() => TvDetailBloc(
        getTvDetail: locator(),
      ));
  locator.registerFactory(
    () => TvOnAirBloc(locator()),
  );
  locator.registerFactory(
    () => TvPopularBloc(locator()),
  );
  locator.registerFactory(() => TvRecommendationBloc(
        getTvRecommendations: locator(),
      ));
  locator.registerFactory(() => TvSearchBloc(
        searchTv: locator(),
      ));
  locator.registerFactory(
    () => TvTopRatedBloc(locator()),
  );
  locator.registerFactory(() => MovieWatchlistBloc(
        getWatchlistMovies: locator(),
        getWatchListStatus: locator(),
        saveWatchlist: locator(),
        removeWatchlist: locator(),
      ));
  locator.registerFactory(() => TvWatchlistBloc(
        getWatchlistTv: locator(),
        getWatchListStatus: locator(),
        saveWatchlist: locator(),
        removeWatchlist: locator(),
      ));

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