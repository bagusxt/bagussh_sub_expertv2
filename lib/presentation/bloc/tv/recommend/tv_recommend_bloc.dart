import 'package:bloc/bloc.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:equatable/equatable.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_recomendations.dart';

part 'tv_recommend_event.dart';
part 'tv_recommend_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetTvclilRecommendations getTvRecommendations;

  TvRecommendationBloc({
    required this.getTvRecommendations,
  }) : super(TvRecommendationEmpty()) {
     on<GetTvRecommendationEvent>((event, emit) async {
      emit(TvRecommendationLoading());
      final result = await getTvRecommendations.execute(event.id);
      result.fold(
        (failure) {
          emit(TvRecommendationError(failure.message));
        },
        (data) {
          emit(TvRecommendationLoaded(data));
        },
      );
    });
  }
}