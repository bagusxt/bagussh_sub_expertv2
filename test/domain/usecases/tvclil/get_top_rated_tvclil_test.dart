import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import '../../../helpers/test_helper_tvclil.mocks.dart';

void main() {
  late GetTopRatedTvclil 
  usecase;
  late MockTvclilRepository 
  mockTvRepository;

  setUp(() {
    mockTvRepository = 
    MockTvclilRepository();
    usecase = 
    GetTopRatedTvclil(mockTvRepository);
  });

  final tTv = <Tvclil>[];

  test('should get list of tv from repository', () async {
    // arrange
    when(mockTvRepository.getTopRatedTv())
        .thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTv));
  });
}