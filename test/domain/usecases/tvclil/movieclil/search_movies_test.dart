import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/usecases/movies/search_movies.dart';

import '../../../../helpers/test_helper_movie_tvclil.mocks.dart';

void main() {
  late SearchMovies 
     usecase;

  late MockMovieRepository 
      mockMovieRepository;

  setUp(() {
    mockMovieRepository = 
       MockMovieRepository();

    usecase = 
       SearchMovies(mockMovieRepository);
  });

  final tMovies = <Movie>[];
  final tQuery = 'Spiderman';

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(tQuery))
        .thenAnswer((_) async => Right(tMovies));
    // act
    final 
      result = await usecase.execute(tQuery);
    // assert
    expect
      (result, Right(tMovies));
    }
  );
}