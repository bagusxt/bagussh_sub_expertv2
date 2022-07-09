part of 'tv_bloc.dart';

//tv_detail
abstract class TvDetailEvent extends Equatable {
  const TvDetailEvent();

  @override
  List<Object> get props => [];
}

class GetTvDetailEvent extends TvDetailEvent {
  final int id;

  const GetTvDetailEvent(this.id);

  @override
  List<Object> get props => [];
}

//search
abstract class TvSearchEvent extends Equatable {
  const TvSearchEvent();

  @override
  List<Object> get props => [];
}

class TvSearchSetEmpty extends TvSearchEvent {}

class TvSearchQueryEvent extends TvSearchEvent {
  final String query;

  const TvSearchQueryEvent(this.query);

  @override
  List<Object> get props => [];
}

//toprated
abstract class TvTopRatedEvent extends Equatable {
  const TvTopRatedEvent();

  @override
  List<Object> get props => [];
}

class TvTopRatedGetEvent extends TvTopRatedEvent {}

//populares
abstract class TvPopularEvent extends Equatable {
  const TvPopularEvent();

  @override
  List<Object> get props => [];
}

class TvPopularGetEvent extends TvPopularEvent {}

//recommend
abstract class TvRecommendationEvent extends Equatable {
  const TvRecommendationEvent();

  @override
  List<Object> get props => [];
}

class GetTvRecommendationEvent extends TvRecommendationEvent {
  final int id;

  const GetTvRecommendationEvent(this.id);

  @override
  List<Object> get props => [];
}

//nowair
abstract class TvOnAirEvent extends Equatable {
  const TvOnAirEvent();

  @override
  List<Object> get props => [];
}

class TvOnAirGetEvent extends TvOnAirEvent {}