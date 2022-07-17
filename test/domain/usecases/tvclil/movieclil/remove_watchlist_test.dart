import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/movies/remove_watchlist.dart';

import '../../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../../../../helpers/test_helper_movie_tvclil.mocks.dart';


void main() {
  late 
    RemoveWatchlist 
     usecase;
  late 
    MockMovieRepository 
       mockMovieRepository;

  setUp(() {
    mockMovieRepository = 
      MockMovieRepository();
    usecase = 
      RemoveWatchlist(mockMovieRepository);
  })
  ;

  test('should remove watchlist movie from repository', () async {
    // arrange
    when(mockMovieRepository.removeWatchlist(testMovieDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = 
      await usecase.execute(testMovieDetail);
    // assert
    verify(mockMovieRepository.removeWatchlist(testMovieDetail));
    expect
      (result, Right('Removed from watchlist'));
  }
  );
}