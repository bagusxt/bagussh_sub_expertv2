import 'package:bloc/bloc.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_now_playing_tvclil.dart';
import 'package:equatable/equatable.dart';

part 'tv_now_air_event.dart';
part 'tv_now_air_state.dart';

class TvOnAirBloc extends Bloc<TvOnAirEvent, TvOnAirState> {
  final GetNowPlayingTvclil getOnAirTv;

  TvOnAirBloc(
    this.getOnAirTv,
  ) : super(TvOnAirEmpty()) {
    on<TvOnAirGetEvent>((event, emit) async {
      emit(TvOnAirLoading());
      final result = await getOnAirTv.execute();
      result.fold(
        (failure) {
          emit(TvOnAirError(failure.message));
        },
        (data) {
          emit(TvOnAirLoaded(data));
        },
      );
    });
  }
}