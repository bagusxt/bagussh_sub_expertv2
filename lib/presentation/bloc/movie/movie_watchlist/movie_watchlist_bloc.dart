import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/entities/movies/movie_detail.dart';
import 'package:sub_bagussh/domain/usecases/movies/save_watchlist.dart';
import 'package:sub_bagussh/domain/usecases/movies/remove_watchlist.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_watchlist_movies.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_watchlist_status.dart';
part 'movie_watchlist_event.dart';

part 'movie_watchlist_state.dart';

class 
  MovieWatchlistBloc 
    extends 

  Bloc
    <MovieWatchlistEvent, 

    MovieWatchlistState>
{

  final 
     GetWatchlistMovies 
       getWatchlistMovies;

  final
     GetWatchListStatus
       getWatchListStatus;
       
  final 
     SaveWatchlist 
       saveWatchlist;

  final
    RemoveWatchlist 
       removeWatchlist;

  MovieWatchlistBloc({

    required 
      this.getWatchlistMovies,

    required 
      this.saveWatchlist,

    required 
      this.removeWatchlist,

    required 
      this.getWatchListStatus,
    
  }
  ) 
  :   super(MovieWatchlistEmpty()) { on<WatchListEvent>((event, emit) async { emit(MovieWatchlistLoading());
         final result = await getWatchlistMovies.execute();
          result.fold( (failure) { emit(MovieWatchlistError(failure.message)); },
            (data) { data.isEmpty ? emit(MovieWatchlistEmpty()) : emit(MovieWatchlistLoaded(data));
      },
    );
  }
);

    on<GetStatusMovieEvent>((event, emit) async { final result = await getWatchListStatus.execute(event.id);
       emit(MovieWatchlistStatusLoaded(result)); });

    on<AddItemMovieEvent>((event, emit) async {final movieDetail = event.movieDetail;
       final result = await saveWatchlist.execute(movieDetail);

        result.fold((failure) {emit(MovieWatchlistError(failure.message));},
          (successMessage) 
            {  emit(MovieWatchlistSuccess(successMessage));
      },
    );
  }
);

      on<RemoveItemMovieEvent>((event, emit) async {final movieDetail = event.movieDetail;
          final result = await removeWatchlist.execute(movieDetail);

      result.fold( (failure) { emit(MovieWatchlistError(failure.message)); },
           (successMessage) {emit(MovieWatchlistSuccess(successMessage));
         },
       );
      }
    );
  }
}