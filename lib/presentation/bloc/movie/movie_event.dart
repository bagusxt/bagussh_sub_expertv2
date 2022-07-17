part of 
'movie_bloc.dart';

class GetMovieDetailEvent extends MovieDetailEvent {final int id; List<Object> get props => [id];
  @override
  GetMovieDetailEvent(this.id);} abstract class MovieDetailEvent extends Equatable {
}


abstract class MovieSearchEvent extends Equatable {const MovieSearchEvent();

  @override List<Object> get props => [];}
    class MovieSearchSetEmpty extends MovieSearchEvent {
}

  class MovieSearchQueryEvent extends MovieSearchEvent {final String query;
    const MovieSearchQueryEvent(this.query);

  @override
     List<Object> 
      get props => [query];
}


class MovieTopRatedGetEvent extends MovieTopRatedEvent {
  @override List<Object> get props => [];
}

abstract class MovieTopRatedEvent extends Equatable { List<Object> get props => [];
  @override const MovieTopRatedEvent();
}  


class MoviePopularGetEvent extends MoviePopularEvent {
    @override List<Object> get props => [];
}

abstract class 
  MoviePopularEvent 
    extends Equatable {
}
  

class GetMovieRecommendationEvent extends MovieRecommendationEvent {
  @override List<Object> get props => [
];

  GetMovieRecommendationEvent(this.id);
    final int id;
}

abstract class 
  MovieRecommendationEvent 
    extends Equatable {
}


class 
  MovieNowPlayingGetEvent 
    extends 
      MovieNowPlayingEvent 
{

  @override List<Object> 
    get props => [];
  
}

abstract class 
  MovieNowPlayingEvent 
    extends Equatable {
}
