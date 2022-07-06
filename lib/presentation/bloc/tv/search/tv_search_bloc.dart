import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/search_tvclil.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_search_event.dart';
part 'tv_search_state.dart';

class TvSearchBloc extends Bloc<TvSearchEvent, TvSearchState> {
  final SearchTvclil searchTv;

  TvSearchBloc({
    required this.searchTv,
  }) : super(TvSearchEmpty()) {
    on<TvSearchSetEmpty>((event, emit) => emit(TvSearchEmpty()));

    on<TvSearchQueryEvent>((event, emit) async {
      emit(TvSearchLoading());
      final result = await searchTv.execute(event.query);
      result.fold(
        (failure) {
          emit(TvSearchError(failure.message));
        },
        (data) {
          emit(TvSearchLoaded(data));
        },
      );
    });
  }
}