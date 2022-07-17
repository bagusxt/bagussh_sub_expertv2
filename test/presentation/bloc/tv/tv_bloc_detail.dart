import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


import '../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../movie_and_tvclil_test/movie_tvclil_test.mocks.dart';

void main() {
  late 
    MockGetTvclilDetail
       mockGetTvDetail;
  late 
    TvDetailBloc 
      tvDetailBloc;
  setUp(() {
    mockGetTvDetail 
      = MockGetTvclilDetail();
    tvDetailBloc 
      = TvDetailBloc
        (getTvDetail: 
          mockGetTvDetail);
    }
  );

  const 
    tvId = 1;

  test("initial state should be empty", () {
    expect(tvDetailBloc.state, TvDetailEmpty());
  });

  group('Top Rated Movies BLoC Test', () {
    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTvDetail.execute(tvId))
            .thenAnswer((_) async => Right(testTvDetail));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(GetTvDetailEvent(tvId)),
      expect: () => [TvDetailLoading(), TvDetailLoaded(testTvDetail)],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(tvId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, Error] when get detail is unsuccessful',
      build: () {
        when(mockGetTvDetail.execute(tvId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(GetTvDetailEvent(tvId)),
      expect: () => [TvDetailLoading(), TvDetailError('Server Failure')],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(tvId));
      },
    );
  },);
}