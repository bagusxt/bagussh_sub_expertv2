import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/save_watchlist_tvclil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../../../helpers/test_helper_movie_tvclil.mocks.dart';


void main() {
  late 
    SaveWatchlistTvclil 
      usecase;
  late 
    MockTvclilRepository 
     mockTvRepository;

  setUp(() {
    mockTvRepository = 
       MockTvclilRepository();
         usecase = 

    SaveWatchlistTvclil
       (mockTvRepository);
  });

  test('should save tv to the repository', () async {
    // arrange
    when(mockTvRepository.saveWatchlistTv(testTvDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final 
      result
        = await usecase.execute(testTvDetail);
    // assert
    verify
      (mockTvRepository.saveWatchlistTv(testTvDetail));
    expect
      (result, Right('Added to Watchlist'));
   }
  );
}