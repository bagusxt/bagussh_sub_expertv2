import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/entities/movies/movie_detail.dart';
import 'package:sub_bagussh/domain/usecases/movies/search_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_movie_detail.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_popular_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_movie_recommendations.dart';
part 'movie_state.dart';


part 'movie_event.dart';

class 
  MovieDetailBloc 
    extends 

  Bloc
    <MovieDetailEvent, 
      MovieDetailState> {

  final
     GetMovieDetail 
      getMovieDetail;

     MovieDetailBloc (

    {required this.getMovieDetail,})  : super(MovieDetailEmpty()) { on<GetMovieDetailEvent>(_loadMovieDetail);}   
    FutureOr<void> _loadMovieDetail( GetMovieDetailEvent event, Emitter<MovieDetailState> emit,
  )

     async {emit(MovieDetailLoading());
       final result = await getMovieDetail.execute(event.id);
        result.fold( (failure) {emit(MovieDetailError(failure.message));
  },
           (data) { emit(MovieDetailLoaded(data));
         },
      );
    }
  }


class 
  MovieSearchBloc
     extends 
     
  Bloc
    <MovieSearchEvent, 
      MovieSearchState> {

  final 
    SearchMovies 
      searchMovies;

MovieSearchBloc (
  {required this.searchMovies,}) : super(MovieSearchEmpty()) { on<MovieSearchSetEmpty>
     ((event, emit) => emit(MovieSearchEmpty()));

    on<MovieSearchQueryEvent>((event, emit) async { emit(MovieSearchLoading());
      final result = await searchMovies.execute(event.query);

          result.fold((failure) {emit(MovieSearchError(failure.message));},
             (data) { emit(MovieSearchLoaded(data));
          },
        );
      }
    );
  }
}


class 
  MovieTopRatedBloc 
    extends 

  Bloc
    <MovieTopRatedEvent, 
      MovieTopRatedState> {

    final 
      GetTopRatedMovies
         getTopRatedMovies;

MovieTopRatedBloc (
   this.getTopRatedMovies) : super(MovieTopRatedEmpty()) { on<MovieTopRatedGetEvent>(_loadTopRated);}

   FutureOr<void> _loadTopRated(MovieTopRatedGetEvent event, Emitter<MovieTopRatedState> emit,
)  

    async{ emit(MovieTopRatedLoading()); final result = await getTopRatedMovies.execute();
        result.fold( (failure) { emit(MovieTopRatedError(failure.message));},
          (data) { emit (MovieTopRatedLoaded(data)
        );
      },
    );
  }
}


class 
  MoviePopularBloc
     extends 
     
  Bloc
    <MoviePopularEvent,
       MoviePopularState> {

  final
     GetPopularMovies 
      getPopularMovies;

MoviePopularBloc (
  this.getPopularMovies,) : super(MoviePopularEmpty()) { on<MoviePopularGetEvent>(_loadMoviePopular);

}
  FutureOr<void> _loadMoviePopular (MoviePopularGetEvent event, Emitter<MoviePopularState> emit,
)
     async {emit(MoviePopularLoading()); final result = await getPopularMovies.execute();
        result.fold((failure) {emit(MoviePopularError(failure.message));},
          (data) { emit (MoviePopularLoaded(data)
        );
      },
    );
  }
}



class 
  MovieRecommendationBloc
    extends 

    Bloc
      <MovieRecommendationEvent, 
        MovieRecommendationState> {

    final 
     GetMovieRecommendations 
      getMovieRecommendations;

MovieRecommendationBloc (
  {required this.getMovieRecommendations}): super(MovieRecommendationEmpty()){
    on<GetMovieRecommendationEvent>(_loadMovieRecommendations);}

    FutureOr<void> _loadMovieRecommendations( GetMovieRecommendationEvent event,
    Emitter<MovieRecommendationState> emit,
) 

async{
      emit(MovieRecommendationLoading()); final result = await getMovieRecommendations.execute(event.id);
        result.fold( (failure) {emit(MovieRecommendationError(failure.message)); },
          (data) { emit (MovieRecommendationLoaded(data)
        );
      },
    );
  }
}


class 
  MovieNowPlayingBloc
    extends 
    
    Bloc
      <MovieNowPlayingEvent, 
        MovieNowPlayingState> {

       final 
        GetNowPlayingMovies 
          getNowPlayingMovies;
          

MovieNowPlayingBloc( 
  
  this.getNowPlayingMovies,) : super(MovieNowPlayingEmpty()) { on<MovieNowPlayingGetEvent>(_loadMovieNowPlaying);
}
    FutureOr<void> _loadMovieNowPlaying(  MovieNowPlayingGetEvent event,Emitter<MovieNowPlayingState> emit,
    
) 

async {

    emit(MovieNowPlayingLoading()); final result = await getNowPlayingMovies.execute();
      result.fold( (failure) { emit(MovieNowPlayingError(failure.message));},
        (data) { data.isEmpty ?emit(MovieNowPlayingEmpty()) :emit(MovieNowPlayingLoaded(data)
        );
      },
    );
  }
}