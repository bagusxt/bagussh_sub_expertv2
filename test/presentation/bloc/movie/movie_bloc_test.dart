import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../movie_and_tvclil_test/movie_tvclil_test.mocks.dart';

void main() {
  late 
    MockGetMovieDetail
       mockGetMovieDetail;
  late 
    MovieDetailBloc 
      movieDetailBloc;

  setUp(() {
    mockGetMovieDetail 
      = MockGetMovieDetail();
    movieDetailBloc 
      = MovieDetailBloc
        (getMovieDetail: mockGetMovieDetail);
  });

  const movieId = 1;

  test("initial state should be empty", () {
    expect(movieDetailBloc.state, MovieDetailEmpty());
  });

  group('Detail Movies BLoC Test', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetMovieDetail.execute(movieId))
            .thenAnswer((_) async => Right(testMovieDetail));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(GetMovieDetailEvent(movieId)),
      expect: () =>
          [MovieDetailLoading(), MovieDetailLoaded(testMovieDetail)],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(movieId));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'Should emit [Loading, Error] when get detail is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(movieId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(GetMovieDetailEvent(movieId)),
      expect: () =>
          [MovieDetailLoading(), MovieDetailError('Server Failure')],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(movieId));
         return movieDetailBloc.state.props;
      },
    );
  });
}
