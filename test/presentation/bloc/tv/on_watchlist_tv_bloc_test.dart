import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';

import 'package:sub_bagussh/presentation/bloc/tv/watchlist/tv_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_movie_tvclil_object.dart';
import '../movie_and_tvclil_test/movie_tvclil_test.mocks.dart';

void 
  main() {
    
  late 
    MockGetWatchlistTvclil 

      mockGetWatchlistTvclil;

  late 
    MockGetWatchListStatusTvclil
    
       mockGetWatchListStatus;

  late 
    MockSaveWatchlistTvclil

       mockSaveWatchlist;
       
  late 
    MockRemoveWatchlistTvclil 

      mockRemoveWatchlist;

  late 
    TvWatchlistBloc 

      tvWatchlistBloc;

  setUp(() {
    mockGetWatchlistTvclil 
      = MockGetWatchlistTvclil();

    mockGetWatchListStatus 
      = MockGetWatchListStatusTvclil();

    mockSaveWatchlist 
      = MockSaveWatchlistTvclil();

    mockRemoveWatchlist 
      = MockRemoveWatchlistTvclil();

    tvWatchlistBloc
       = TvWatchlistBloc(

      getWatchlistTv: 
        mockGetWatchlistTvclil,

      getWatchListStatus: 
        mockGetWatchListStatus,

      saveWatchlist: 
        mockSaveWatchlist,

      removeWatchlist: 
        mockRemoveWatchlist,
      );
    }
  );

  const 
    tvId = 1;

  test("initial state should be empty", () {
    expect(tvWatchlistBloc.state, TvWatchlistEmpty());
  });

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTvclil.execute())
          .thenAnswer((_) async => Right(testWatchlistTvList));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(GetListEvent()),
    expect: () =>
        [TvWatchlistLoading(), TvWatchlistLoaded(testWatchlistTvList)],
    verify: (bloc) {
      verify(mockGetWatchlistTvclil.execute());
    },
  );

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockGetWatchlistTvclil.execute())
          .thenAnswer((_) async => Left(ServerFailure("Can't get data")));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(GetListEvent()),
    expect: () =>
        [TvWatchlistLoading(), const TvWatchlistError("Can't get data")],
    verify: (bloc) {
      verify(mockGetWatchlistTvclil.execute());
    },
  );

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [Loaded] when get status tv watchlist is successful',
    build: () {
      when(mockGetWatchListStatus.execute(tvId))
          .thenAnswer((_) async => true);
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(const GetStatusTvEvent(tvId)),
    expect: () => [const TvWatchlistStatusLoaded(true)],
    verify: (bloc) {
      verify(mockGetWatchListStatus.execute(tvId));
    },
  );

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [success] when add tv item to watchlist is successful',
    build: () {
      when(mockSaveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Right("Success"));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(AddItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistSuccess("Success")],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [success] when remove tv item to watchlist is successful',
    build: () {
      when(mockRemoveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Right("Removed"));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(RemoveItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistSuccess("Removed")],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [error] when add tv item to watchlist is unsuccessful',
    build: () {
      when(mockSaveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(AddItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistError("Failed")],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<TvWatchlistBloc, TvWatchlistState>(
    'Should emit [error] when remove tv item to watchlist is unsuccessful',
    build: () {
      when(mockRemoveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return tvWatchlistBloc;
    },
    act: (bloc) => bloc.add(RemoveItemTvEvent(testTvDetail)),
    expect: () => [const TvWatchlistError("Failed")],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testTvDetail));
    },
  );
}
