part of 
'movie_watchlist_bloc.dart';

  class MovieWatchlistError extends MovieWatchlistState 

{
  @override const MovieWatchlistError(this.message);
  List<Object> get props => [message]; final String message;
}

  class MovieWatchlistSuccess extends MovieWatchlistState 

{
  final String message; const MovieWatchlistSuccess(this.message);
  @override List<Object> get props => [message];
}

  class MovieWatchlistLoaded extends MovieWatchlistState 

{
  final List<Movie> result; const MovieWatchlistLoaded(this.result);
  @override List<Object> get props => [result];
}

  class MovieWatchlistEmpty extends MovieWatchlistState 
{
  final 
    String message
   = 'Watchlist Movies is Empty';
}

  abstract class MovieWatchlistState extends Equatable 
{
  const MovieWatchlistState();
  @override List<Object> get props => [];
}

  class MovieWatchlistStatusLoaded extends MovieWatchlistState
{
  final bool result; const MovieWatchlistStatusLoaded(this.result);
  @override  List<Object> get props => [result];
}

  class MovieWatchlistLoading extends MovieWatchlistState{
  final 
    String message 
      = 'Watchlist Movies is Loading';
}