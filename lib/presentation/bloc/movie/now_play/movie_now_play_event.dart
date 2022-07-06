part of 'movie_now_play_bloc.dart';

abstract class MovieNowPlayingEvent extends Equatable {
  const MovieNowPlayingEvent();

  @override
  List<Object> get props => [];
}

class MovieNowPlayingGetEvent extends MovieNowPlayingEvent {}