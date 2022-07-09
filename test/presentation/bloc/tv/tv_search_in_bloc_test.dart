import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/search_tvclil.dart';
import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_search_in_bloc_test.mocks.dart';

@GenerateMocks([TvSearchBloc,SearchTvclil])
void main() {
  late MockSearchTvclil mockSearchTv;
  late TvSearchBloc tvSearchBloc;

  setUp(() {
    mockSearchTv = MockSearchTvclil();
    tvSearchBloc = TvSearchBloc(
      searchTv: mockSearchTv,
    );
  });

  const query = "originalTitle";
  final tvList = <Tvclil>[];

  test("initial state should be empty", () {
    expect(tvSearchBloc.state, TvSearchEmpty());
  });

  blocTest<TvSearchBloc, TvSearchState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockSearchTv.execute(query))
          .thenAnswer((_) async => Right(tvList));
      return tvSearchBloc;
    },
    act: (bloc) => bloc.add(const TvSearchQueryEvent(query)),
    expect: () => [TvSearchLoading(), TvSearchLoaded(tvList)],
    verify: (bloc) {
      verify(mockSearchTv.execute(query));
    },
  );

  group('Search Tv BLoC Test', () {
    blocTest<TvSearchBloc, TvSearchState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchTv.execute(query))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return tvSearchBloc;
      },
      act: (bloc) => bloc.add(const TvSearchQueryEvent(query)),
      expect: () =>
          [TvSearchLoading(), const TvSearchError('Server Failure')],
      verify: (bloc) {
        verify(mockSearchTv.execute(query));
      },
    );
    },
  );
}