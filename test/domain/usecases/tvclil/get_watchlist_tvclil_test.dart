import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_status_tvclil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import '../../../helpers/test_helper_tvclil.mocks.dart';

void main() {
  late GetWatchListStatusTvclil 
  usecase;
  late MockTvclilRepository 
  mockTvRepository;

  setUp(() {
    mockTvRepository = 
    MockTvclilRepository();
    usecase = 
    GetWatchListStatusTvclil
    (mockTvRepository);
  });

  test('should get watchlist tv status from repository', () async {
    // arrange
    when(mockTvRepository.isAddedToWatchlistTv(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}