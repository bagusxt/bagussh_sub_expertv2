part of 'tv_top_rate_bloc.dart';

abstract class TvTopRatedEvent extends Equatable {
  const TvTopRatedEvent();

  @override
  List<Object> get props => [];
}

class TvTopRatedGetEvent extends TvTopRatedEvent {}