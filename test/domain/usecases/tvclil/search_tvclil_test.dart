import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/search_tvclil.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../helpers/test_helper_tvclil.mocks.dart';

void main() {
  late SearchTvclil 
  usecase;
  late MockTvclilRepository 
  mockTvRepository;

  setUp(() {
    mockTvRepository = 
    MockTvclilRepository();
    usecase = 
    SearchTvclil(mockTvRepository);
  });

  final tTv = <Tvclil>[];
  final tQuery = 'Game of throne';

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.searchTv(tQuery))
        .thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTv));
  });
}