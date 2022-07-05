import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_tvclil.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/watchlist_tvclil_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects_tvclil.dart';
import 'watchlist_tvclil_notifier_test.mocks.dart';

@GenerateMocks([GetWatchlistTvclil])
void main() {
  late WatchlistTvclilNotifier 
  provider;
  late MockGetWatchlistTvclil 
  mockGetWatchlistTv;
  late int 
  listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTv = MockGetWatchlistTvclil();
    provider = WatchlistTvclilNotifier(
      getWatchlistTv: mockGetWatchlistTv,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });

  test('should change tv data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistTv.execute())
        .thenAnswer((_) async => Right([testWatchlistTv]));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistTvState, RequestState.Loaded);
    expect(provider.watchlistTv, [testWatchlistTv]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistTv.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect
    (provider.watchlistTvState, RequestState.Error);
    expect
    (provider.message, "Can't get data");
    expect
    (listenerCallCount, 2);
  });
}