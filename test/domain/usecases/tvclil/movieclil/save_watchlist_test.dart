import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/movies/save_watchlist.dart';

import '../../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../../../../helpers/test_helper_movie_tvclil.mocks.dart';


void main() {
  late 
    SaveWatchlist 
      usecase;
  late 
    MockMovieRepository 
      mockMovieRepository;

  setUp(() {
    mockMovieRepository = 
       MockMovieRepository();
       
    usecase = 
       SaveWatchlist
        (mockMovieRepository);
      }
  );

  test('should save movie to the repository', () async {
    // arrange
    when(mockMovieRepository.saveWatchlist(testMovieDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = 
      await usecase.execute(testMovieDetail);
    // assert
    verify
      (mockMovieRepository.saveWatchlist(testMovieDetail));

    expect
      (result, Right('Added to Watchlist'));
  }
  );
}