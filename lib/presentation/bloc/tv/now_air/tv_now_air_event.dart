part of 'tv_now_air_bloc.dart';

abstract class TvOnAirEvent extends Equatable {
  const TvOnAirEvent();

  @override
  List<Object> get props => [];
}

class TvOnAirGetEvent extends TvOnAirEvent {}