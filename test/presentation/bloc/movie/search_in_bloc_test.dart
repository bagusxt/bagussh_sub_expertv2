import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart';

import '../movie_and_tvclil_test/movie_tvclil_test.mocks.dart';

void main() {
  late 
    MockSearchMovies 
      mockSearchMovies;

  late
     MovieSearchBloc
       movieSearchBloc;

  setUp(() {
    mockSearchMovies
       = MockSearchMovies();

    movieSearchBloc 
      = MovieSearchBloc(
        
      searchMovies: 
        mockSearchMovies,
     );
   }
  );

  const 
    query = "originalTitle";
    
  final 
    movieList
     = <Movie>[];

  test("initial state should be empty", () {
    expect(movieSearchBloc.state, MovieSearchEmpty());
  });

  blocTest<MovieSearchBloc, MovieSearchState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(query))
          .thenAnswer((_) async => Right(movieList));
      return movieSearchBloc;
    },
    act: (bloc) => bloc.add(const MovieSearchQueryEvent(query)),
    expect: () => [MovieSearchLoading(), MovieSearchLoaded(movieList)],
    verify: (bloc) {
      verify(mockSearchMovies.execute(query));
    },
  );

  group('Search Movies BLoC Test', () {
    blocTest<MovieSearchBloc, MovieSearchState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchMovies.execute(query))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return movieSearchBloc;
      },
      act: (bloc) => bloc.add(const MovieSearchQueryEvent(query)),
      expect: () =>
          [MovieSearchLoading(), const MovieSearchError('Server Failure')],
      verify: (bloc) {
        verify(mockSearchMovies.execute(query));
      },
    );
    },
  );
}