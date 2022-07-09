import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_now_playing_tvclil.dart';

import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_airing_bloc_test.mocks.dart';

@GenerateMocks([TvOnAirBloc,GetNowPlayingTvclil])
void main() {
  late MockGetNowPlayingTvclil mockGetNowPlayingTv;
  late TvOnAirBloc tvOnAirBloc;

  setUp(() {
    mockGetNowPlayingTv = MockGetNowPlayingTvclil();
    tvOnAirBloc = TvOnAirBloc(mockGetNowPlayingTv);
  });

  final tvList = <Tvclil>[];

  test("initial state should be empty", () {
    expect(tvOnAirBloc.state, TvOnAirEmpty());
  });

  group('On Air Tv BLoC Test', () {
    blocTest<TvOnAirBloc, TvOnAirState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingTv.execute())
            .thenAnswer((_) async => Right(tvList));
        return tvOnAirBloc;
      },
      act: (bloc) => bloc.add(TvOnAirGetEvent()),
      expect: () => [TvOnAirLoading(), TvOnAirLoaded(tvList)],
      verify: (bloc) {
        verify(mockGetNowPlayingTv.execute());
      },
    );

    blocTest<TvOnAirBloc, TvOnAirState>(
      'Should emit [Loading, Error] when get now playing is unsuccessful',
      build: () {
        when(mockGetNowPlayingTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvOnAirBloc;
      },
      act: (bloc) => bloc.add(TvOnAirGetEvent()),
      expect: () => [
        TvOnAirLoading(),
        const TvOnAirError('Server Failure')
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingTv.execute());
      },
    );
    },
  );
}