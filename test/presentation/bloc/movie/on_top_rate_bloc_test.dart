import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';

import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../movie_and_tvclil_test/movie_tvclil_test.mocks.dart';

void main() {
  late 
    MockGetTopRatedMovies 
      mockGetTopRatedMovies;

  late 
    MovieTopRatedBloc 
      movieTopRatedBloc;

  setUp(() {
    mockGetTopRatedMovies
       = MockGetTopRatedMovies();

    movieTopRatedBloc 
      = MovieTopRatedBloc(mockGetTopRatedMovies);
  });

  final
    movieList 
       = <Movie>[];

  test("initial state should be empty", () {
    expect(movieTopRatedBloc.state, MovieTopRatedEmpty());
  });

  group('Top Rated Movies BLoC Test', () {
    blocTest<MovieTopRatedBloc, MovieTopRatedState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(movieList));
        return movieTopRatedBloc;
      },
      act: (bloc) => bloc.add(MovieTopRatedGetEvent()),
      expect: () => [MovieTopRatedLoading(), MovieTopRatedLoaded(movieList)],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );

    blocTest<MovieTopRatedBloc, MovieTopRatedState>(
      'Should emit [Loading, Error] when get top rated is unsuccessful',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return movieTopRatedBloc;
      },
      act: (bloc) => bloc.add(MovieTopRatedGetEvent()),
      expect: () =>
          [MovieTopRatedLoading(), MovieTopRatedError('Server Failure')],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );
  },);
}