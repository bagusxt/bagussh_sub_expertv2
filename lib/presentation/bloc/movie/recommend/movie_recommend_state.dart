part of 'movie_recommend_bloc.dart';

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