import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

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
import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';
import 'package:sub_bagussh/presentation/bloc/tv/watchlist/tv_watchlist_bloc.dart';

@GenerateMocks(

[

MovieDetailBloc,
GetMovieDetail,

MovieNowPlayingBloc,
GetNowPlayingMovies,

MoviePopularBloc,
GetPopularMovies,

MovieRecommendationBloc,
GetMovieRecommendations,

MovieSearchBloc,
SearchMovies,

GetTopRatedMovies,
MovieTopRatedBloc,

MovieWatchlistBloc,

GetWatchlistMovies,
GetWatchListStatus,

RemoveWatchlist,
SaveWatchlist,

  TvWatchlistBloc,
  GetWatchlistTvclil,

  GetWatchListStatusTvclil,
  RemoveWatchlistTvclil,
  SaveWatchlistTvclil,

  TvOnAirBloc,
  GetNowPlayingTvclil,

  GetTvclilDetail,
  TvDetailBloc,

  GetPopularTvclil,
  TvPopularBloc,

  TvRecommendationBloc,
  GetTvclilRecommendations,

  TvSearchBloc,
  SearchTvclil,

  GetTopRatedTvclil,
  TvTopRatedBloc,
  
], 

customMocks: 
  [ MockSpec<http.Client>
     (as: #MockHttpClient) ]
) 
  void 
    main() 
{}