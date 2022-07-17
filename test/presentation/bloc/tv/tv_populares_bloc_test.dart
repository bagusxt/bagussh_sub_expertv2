import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../movie_and_tvclil_test/movie_tvclil_test.mocks.dart';

void main() {
  late
    MockGetPopularTvclil 
      mockGetPopularTv;

      late 
        TvPopularBloc
            tvPopularBloc;

  setUp(() {
    mockGetPopularTv 
      = MockGetPopularTvclil();

        tvPopularBloc
           = TvPopularBloc(mockGetPopularTv);
    }
  );

  // ignore: non_constant_identifier_names
  final 
    TvList 
      = <Tvclil>[];

  test("initial state should be empty", () {
    expect(tvPopularBloc.state, TvPopularEmpty());
  });

  group('Popular Tv BLoC Test', () {
    blocTest<TvPopularBloc, TvPopularState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetPopularTv.execute()).thenAnswer((_) async => Right(TvList));
        return tvPopularBloc;
      },
      act: (bloc) => bloc.add(TvPopularGetEvent()),
      expect: () => [TvPopularLoading(), TvPopularLoaded(TvList)],
      verify: (bloc) {
        verify(mockGetPopularTv.execute());
      },
    );

    blocTest<TvPopularBloc, TvPopularState>(
      'Should emit [Loading, Error] when get popular is unsuccessful',
      build: () {
        when(mockGetPopularTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvPopularBloc;
      },
      act: (bloc) => bloc.add(TvPopularGetEvent()),
      expect: () => [TvPopularLoading(),  TvPopularError('Server Failure')],
      verify: (bloc) {
        verify(mockGetPopularTv.execute());
      },
    );
  },);
}