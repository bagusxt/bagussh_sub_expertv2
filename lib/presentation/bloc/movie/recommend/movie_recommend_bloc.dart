import 'package:bloc/bloc.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'movie_recommend_event.dart';
part 'movie_recommend_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations getMovieRecommendations;

  MovieRecommendationBloc({
    required this.getMovieRecommendations,
  }) : super(MovieRecommendationEmpty()){
  on<GetMovieRecommendationEvent>((event, emit) async {
      emit(MovieRecommendationLoading());
      final result = await getMovieRecommendations.execute(event.id);
      result.fold(
        (failure) {
          emit(MovieRecommendationError(failure.message));
        },
        (data) {
          emit(MovieRecommendationLoaded(data));
        },
      );
    });
  }
}