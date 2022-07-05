import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/top_rated_tvclil_notifier.dart';

import 'top_rated_tvclil_notifier_test.mocks.dart';

@GenerateMocks([GetTopRatedTvclil])
void main() {
  late MockGetTopRatedTvclil 
  mockGetTopRatedTv;
  late TopRatedTvclilNotifier 
  notifier;
  late int 
  listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedTv = MockGetTopRatedTvclil();
    notifier = TopRatedTvclilNotifier
    (getTopRatedTv: mockGetTopRatedTv)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTv = Tvclil(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTvList = <Tvclil>[tTv];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTopRatedTv.execute())
        .thenAnswer((_) async => Right(tTvList));
    // act
    notifier.fetchTopRatedTv();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change tv data when data is gotten successfully', () async {
    // arrange
    when(mockGetTopRatedTv.execute())
        .thenAnswer((_) async => Right(tTvList));
    // act
    await notifier.fetchTopRatedTv();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tv, tTvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTopRatedTv.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchTopRatedTv();
    // assert
    expect
    (notifier.state, RequestState.Error);
    expect
    (notifier.message, 'Server Failure');
    expect
    (listenerCallCount, 2);
  });
}