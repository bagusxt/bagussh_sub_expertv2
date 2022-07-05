import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_recomendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import '../../../helpers/test_helper_tvclil.mocks.dart';

void main() {
  late GetTvclilRecommendations 
  usecase;
  late MockTvclilRepository 
  mockTvRepository;

  setUp(() {
    mockTvRepository = 
    MockTvclilRepository();
    usecase = 
    GetTvclilRecommendations(mockTvRepository);
  });

  final tId = 1;
  final tTv = <Tvclil>[];

  test('should get list of tv recommendations from the repository',
          () async {
        // arrange
        when(mockTvRepository.getTvRecommendations(tId))
            .thenAnswer((_) async => Right(tTv));
        // act
        final result = await usecase.execute(tId);
        // assert
        expect(result, Right(tTv));
      });
}