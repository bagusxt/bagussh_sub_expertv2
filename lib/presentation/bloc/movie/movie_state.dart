part of 'movie_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
  @override
  List<Object> get props => [];
}

class MovieDetailEmpty extends MovieDetailState {}
class MovieDetailLoading extends MovieDetailState {}
class MovieDetailError extends MovieDetailState {
  final String message;
  const MovieDetailError(this.message);
  @override
  List<Object> get props => [message];
}
class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieDetail;
  const MovieDetailLoaded(this.movieDetail);
  @override
  List<Object> get props => [movieDetail];
}

//search
abstract class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

class MovieSearchEmpty extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchError extends MovieSearchState {
  final String message;

  const MovieSearchError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieSearchLoaded extends MovieSearchState {
  final List<Movie> result;

  const MovieSearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}


//toprated
abstract class MovieTopRatedState extends Equatable {
  const MovieTopRatedState();

  @override
  List<Object> get props => [];
}

class MovieTopRatedEmpty extends MovieTopRatedState {}

class MovieTopRatedLoading extends MovieTopRatedState {}

class MovieTopRatedError extends MovieTopRatedState {
  final String message;

  const MovieTopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieTopRatedLoaded extends MovieTopRatedState {
  final List<Movie> result;

  const MovieTopRatedLoaded(this.result);

  @override
  List<Object> get props => [result];
}

//popular
abstract class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object> get props => [];
}

class MoviePopularEmpty extends MoviePopularState {}

class MoviePopularLoading extends MoviePopularState {}

class MoviePopularError extends MoviePopularState {
  final String message;

  const MoviePopularError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviePopularLoaded extends MoviePopularState {
  final List<Movie> result;

  const MoviePopularLoaded(this.result);

  @override
  List<Object> get props => [result];
}

//top_rated
abstract class MovieRecommendationState extends Equatable {
  const MovieRecommendationState();

  @override
  List<Object> get props => [];
}

class MovieRecommendationEmpty extends MovieRecommendationState {}

class MovieRecommendationLoading extends MovieRecommendationState {}

class MovieRecommendationError extends MovieRecommendationState {
  final String message;

  const MovieRecommendationError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieRecommendationLoaded extends MovieRecommendationState {
  final List<Movie> movie;

  const MovieRecommendationLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

//now_play
abstract class MovieNowPlayingState extends Equatable {
  const MovieNowPlayingState();

  @override
  List<Object> get props => [];
}

class MovieNowPlayingEmpty extends MovieNowPlayingState {}

class MovieNowPlayingLoading extends MovieNowPlayingState {}

class MovieNowPlayingError extends MovieNowPlayingState {
  final String message;

  const MovieNowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieNowPlayingLoaded extends MovieNowPlayingState {
  final List<Movie> result;

  const MovieNowPlayingLoaded(this.result);

  @override
  List<Object> get props => [result];
}