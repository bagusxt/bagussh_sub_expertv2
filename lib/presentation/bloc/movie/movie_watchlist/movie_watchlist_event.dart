part of
'movie_watchlist_bloc.dart';

   class AddItemMovieEvent extends MovieWatchlistEvent {final MovieDetail movieDetail; 
   const AddItemMovieEvent(this.movieDetail);

}

   class RemoveItemMovieEvent extends MovieWatchlistEvent {final MovieDetail movieDetail;
   @override List<Object> get props => [movieDetail]; const RemoveItemMovieEvent(this.movieDetail);
  
}

  class WatchListEvent extends MovieWatchlistEvent {} 
  class GetStatusMovieEvent extends MovieWatchlistEvent {final int id; const GetStatusMovieEvent(this.id);
  @override List<Object> get props => [id];

}

abstract class MovieWatchlistEvent extends Equatable {
  @override List<Object> get props => []; const MovieWatchlistEvent();

}