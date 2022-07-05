import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/remove_watchlist_tvclil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import '../../../dummy_data/dummy_objects_tvclil.dart';
import '../../../helpers/test_helper_tvclil.mocks.dart';

void main() {
  late RemoveWatchlistTvclil 
  usecase;
  late MockTvclilRepository 
  mockTvRepository;

  setUp(() {
    mockTvRepository = 
    MockTvclilRepository();
    usecase = 
    RemoveWatchlistTvclil
    (mockTvRepository);
  });

  test('should remove watchlist tv from repository', () async {
    // arrange
    when(mockTvRepository.removeWatchlistTv(testTvDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTvDetail);
    // assert
    verify(mockTvRepository.removeWatchlistTv(testTvDetail));
    expect(result, Right('Removed from watchlist'));
  });
}