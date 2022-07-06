import 'package:bloc/bloc.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_popluar_tvclil.dart';
import 'package:equatable/equatable.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  final GetPopularTvclil getPopularTv;

  TvPopularBloc(
    this.getPopularTv,
  ) : super(TvPopularEmpty()) {
    on<TvPopularGetEvent>((event, emit) async {
      emit(TvPopularLoading());
      final result = await getPopularTv.execute();
      result.fold(
        (failure) {
          emit(TvPopularError(failure.message));
        },
        (data) {
          emit(TvPopularLoaded(data));
        },
      );
    });
  }
}