import 'package:bloc/bloc.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:equatable/equatable.dart';

part 'tv_top_rate_event.dart';
part 'tv_top_rate_state.dart';

class TvTopRatedBloc extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  final GetTopRatedTvclil getTopRatedTv;

  TvTopRatedBloc(
    this.getTopRatedTv,
  ) : super(TvTopRatedEmpty()) {
    on<TvTopRatedGetEvent>((event, emit) async {
      emit(TvTopRatedLoading());
      final result = await getTopRatedTv.execute();
      result.fold(
        (failure) {
          emit(TvTopRatedError(failure.message));
        },
        (data) {
          emit(TvTopRatedLoaded(data));
        },
      );
    });
  }
}