import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_movie_detail.dart';

import '../../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../../../../helpers/test_helper_movie_tvclil.mocks.dart';


void main() {
  late 
    GetMovieDetail 
      usecase;
  late 
    MockMovieRepository 
      mockMovieRepository;

  setUp(() {
    mockMovieRepository = 
      MockMovieRepository();
    usecase = 
      GetMovieDetail
        (mockMovieRepository);
  }
  );

  final tId = 1;

  test('should get movie detail from the repository', () async {
    // arrange
    when(mockMovieRepository.getMovieDetail(tId))
        .thenAnswer((_) async => Right(testMovieDetail));
    // act
    final result 
      = await usecase.execute(tId);
    // assert
    expect
      (result, Right(testMovieDetail));
    }
  );
}