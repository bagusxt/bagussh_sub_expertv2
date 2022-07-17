import '../../dummy_data/dummy_movie_tvclil_object.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sub_bagussh/common/exception.dart';
import 'package:sub_bagussh/data/datasources/tvclil/tvclil_local_data_source.dart';

import '../../helpers/test_helper_movie_tvclil.mocks.dart';

void main() {
  late 
    TvclilLocalDataSourceImpl 
       dataSourcetv;
  late 
    MockDatabaseHelperTvclil 
       mockDatabaseHelperTv;

  setUp(() {

    mockDatabaseHelperTv = 
      MockDatabaseHelperTvclil();
    dataSourcetv = 
      TvclilLocalDataSourceImpl

    (databaseHelpertvclil:  mockDatabaseHelperTv);
  }
);

  group('save watchlist tv', () {
    test('should return success message when insert to database is success',
            () async {
          // arrange
          when(mockDatabaseHelperTv.insertWatchlistTv(testTvTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.insertWatchlistTv(testTvTable);
          // assert
          expect(result, 'Added to Watchlist');
        });

    test('should throw DatabaseException when insert tv to database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTv.insertWatchlistTv(testTvTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.insertWatchlistTv(testTvTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('remove watchlist tv', () {

    test('should throw DatabaseException when remove tv from database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTv.removeWatchlistTv(testTvTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.removeWatchlistTv(testTvTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('Get Tv Detail By Id', () {
    final tId = 1;

    test('should return Tv Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTv.getTvById(tId))
          .thenAnswer((_) async => testTvMap);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, testTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTv.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSourcetv.getTvById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv', () {
    test('should return list of TvTable from database', () async {
      // arrange
      when(mockDatabaseHelperTv.getWatchlistTv())
          .thenAnswer((_) async => [testTvMap]);
      // act
      final result = await dataSourcetv.getWatchlistTv();
      // assert
      expect(result, [testTvTable]);
    });
  });
}