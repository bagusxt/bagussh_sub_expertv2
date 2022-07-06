import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_now_play_event.dart';
part 'movie_now_play_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  MovieNowPlayingBloc(
    this.getNowPlayingMovies,
  ) : super(MovieNowPlayingEmpty()) {
    on<MovieNowPlayingGetEvent>((event, emit) async {
      emit(MovieNowPlayingLoading());
      final result = await getNowPlayingMovies.execute();
      result.fold(
        (failure) {
          emit(MovieNowPlayingError(failure.message));
        },
        (data) {
          emit(MovieNowPlayingLoaded(data));
        },
      );
    });
  }
}