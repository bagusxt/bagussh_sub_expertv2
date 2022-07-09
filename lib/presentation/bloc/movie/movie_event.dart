part of 'movie_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int id;

  const GetMovieDetailEvent(this.id);

  @override
  List<Object> get props => [];
}

//search
abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();

  @override
  List<Object> get props => [];
}

class MovieSearchSetEmpty extends MovieSearchEvent {}

class MovieSearchQueryEvent extends MovieSearchEvent {
  final String query;

  const MovieSearchQueryEvent(this.query);

  @override
  List<Object> get props => [];
}

//toprrated
abstract class MovieTopRatedEvent extends Equatable {
  const MovieTopRatedEvent();

  @override
  List<Object> get props => [];
}

class MovieTopRatedGetEvent extends MovieTopRatedEvent {}

//populares
abstract class MoviePopularEvent extends Equatable {
  const MoviePopularEvent();

  @override
  List<Object> get props => [];
}

class MoviePopularGetEvent extends MoviePopularEvent {}

//top_rated
abstract class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();

  @override
  List<Object> get props => [];
}

class GetMovieRecommendationEvent extends MovieRecommendationEvent {
  final int id;

  const GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [];
}

//now_play
abstract class MovieNowPlayingEvent extends Equatable {
  const MovieNowPlayingEvent();

  @override
  List<Object> get props => [];
}

class MovieNowPlayingGetEvent extends MovieNowPlayingEvent {}