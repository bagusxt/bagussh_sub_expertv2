import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_detail.dart';


import '../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../../../helpers/test_helper_movie_tvclil.mocks.dart';


void main() {
  late 
    GetTvclilDetail 
      usecase;

  late
     MockTvclilRepository 
       mockMovieRepository;

  setUp(() {
    mockMovieRepository = 
      MockTvclilRepository();

    usecase = 
      GetTvclilDetail(mockMovieRepository);
  }
  );

  final tId = 1;

  test('should get tv detail from the repository', () async {
    // arrange
    when(mockMovieRepository.getTvDetail(tId))
        .thenAnswer((_) async => Right(testTvDetail));
    // act
    final result
       = await usecase.execute(tId);
    // assert
    expect
      (result, Right(testTvDetail));
    }
  );
}