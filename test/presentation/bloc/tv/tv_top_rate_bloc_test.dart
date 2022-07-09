import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'tv_top_rate_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvclil, TvTopRatedBloc])
void main() {
  late MockGetTopRatedTvclil mockGetTopRatedTv;
  late TvTopRatedBloc tvTopRatedBloc;

  setUp(() {
    mockGetTopRatedTv = MockGetTopRatedTvclil();
    tvTopRatedBloc = TvTopRatedBloc(mockGetTopRatedTv);
  });

  final tvList = <Tvclil>[];

  test("initial state should be empty", () {
      expect(tvTopRatedBloc.state, TvTopRatedEmpty());
    });

  group('Top Rated Movies BLoC Test', () {
    blocTest<TvTopRatedBloc, TvTopRatedState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTv.execute())
            .thenAnswer((_) async => Right(tvList));
        return tvTopRatedBloc;
      },
      act: (bloc) => bloc.add(TvTopRatedGetEvent()),
      expect: () => [TvTopRatedLoading(), TvTopRatedLoaded(tvList)],
      verify: (bloc) {
        verify(mockGetTopRatedTv.execute());
      },
    );

    blocTest<TvTopRatedBloc, TvTopRatedState>(
      'Should emit [Loading, Error] when get top rated is unsuccessful',
      build: () {
        when(mockGetTopRatedTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvTopRatedBloc;
      },
      act: (bloc) => bloc.add(TvTopRatedGetEvent()),
      expect: () =>
          [TvTopRatedLoading(), const TvTopRatedError('Server Failure')],
      verify: (bloc) {
        verify(mockGetTopRatedTv.execute());
      },
    );
  },);
}