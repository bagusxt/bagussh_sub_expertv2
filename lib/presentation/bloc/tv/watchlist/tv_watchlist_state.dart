part of 'tv_watchlist_bloc.dart';

abstract 
  class 
    TvWatchlistState 

extends 
  Equatable {
    const 
      TvWatchlistState();

  @override List<Object>
       get props => [];
}

class
   TvWatchlistStatusLoaded 

extends 

  TvWatchlistState {
    final bool result;

  const 
    TvWatchlistStatusLoaded(this.result);

  @override
    List<Object> 
     get props => [result];
}

class
   TvWatchlistLoaded 

extends 
  TvWatchlistState {

  final 
    List<Tvclil> result;

  const 
    TvWatchlistLoaded
      (this.result);

  @override
  List<Object> 
    get props 
      => [result];
}

class 
  TvWatchlistLoading
     extends TvWatchlistState {
      
   final String message 
   
    = 'Tv Watchlist is Loading';
}


class
   TvWatchlistSuccess

  extends 
    TvWatchlistState {

  final 
    String message;

  const 
    TvWatchlistSuccess
      (this.message);

  @override
  List<Object> 
    get props => [message];
}

class TvWatchlistError
   extends TvWatchlistState {

  final 
    String message;

  const 
    TvWatchlistError(this.message);

  @override
  List<Object> 
    get props => [message];
}

class 
  TvWatchlistEmpty 

  extends 
    TvWatchlistState {
      
  final 
    String message

     = 'Empty, No Tv Watchlist Added';
}