import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_watchlist_movies.dart';

import '../../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../../../../helpers/test_helper_movie_tvclil.mocks.dart';


void main() {
  late 
    GetWatchlistMovies 
     usecase;
  late
     MockMovieRepository 
       mockMovieRepository;

  setUp(() {
    mockMovieRepository = 
       MockMovieRepository();
         usecase = 
    GetWatchlistMovies
         (mockMovieRepository);
  }
  );

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getWatchlistMovies())
        .thenAnswer((_) async => Right(testMovieList));
    // act
    final result 
      = await usecase.execute();
    // assert
    expect
      (result, Right(testMovieList));
    }
  );
}