import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sub_bagussh/data/datasources/tvclil/tvclil_remote_data_source.dart';
import 'package:sub_bagussh/data/models/tvclil/tvclil_detail_model.dart';
import 'package:sub_bagussh/data/models/tvclil/tvclil_response.dart';
import 'package:sub_bagussh/common/exception.dart';

import '../../helpers/test_helper_movie_tvclil.mocks.dart';
import '../../json_reader.dart';

void main() {

  const 
    API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const 
    BASE_URL = 'https://api.themoviedb.org/3';

  late
     TvclilRemoteDataSourceImpl 
        dataSourcetv;

  late 
    MockHttpClient 
         mockHttpClient;

  setUp(() {
    mockHttpClient = 
      MockHttpClient();

    dataSourcetv = 
     TvclilRemoteDataSourceImpl
      (client:
         mockHttpClient);
  }
);

  group('get Now Playing Tv', () {
    final tTvList = TvclilResponse.fromJson(
        json.decode(readJson('dummy_data/on_the_air.json')))
        .tvList;

    test('should return list of Tv Model when the response code is 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/on_the_air.json'), 200));
          // act
          final result = await dataSourcetv.getNowPlayingTv();
          // assert
          expect(result, equals(tTvList));
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourcetv.getNowPlayingTv();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Popular Tv', () {
    final tTvList =
        TvclilResponse.fromJson(json.decode(readJson('dummy_data/popular_tvclil.json')))
            .tvList;

    test('should return list of tv when response is success (200)',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/popular_tvclil.json'), 200));
          // act
          final result = await dataSourcetv.getPopularTv();
          // assert
          expect(result, tTvList);
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourcetv.getPopularTv();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Top Rated Tv', () {
    final tTvList = TvclilResponse.fromJson(
        json.decode(readJson('dummy_data/top_rated_tvclil.json')))
        .tvList;

    test('should return list of tv when response code is 200 ', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/top_rated_tvclil.json'), 200));
      // act
      final result = await dataSourcetv.getTopRatedTv();
      // assert
      expect(result, tTvList);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourcetv.getTopRatedTv();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get tv detail', () {
    final tId = 1;
    final tTvDetail = TvclilDetailResponse.fromJson(
        json.decode(readJson('dummy_data/tvclil_detail.json')));

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/tvclil_detail.json'), 200));
      // act
      final result = await dataSourcetv.getTvDetail(tId);
      // assert
      expect(result, equals(tTvDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourcetv.getTvDetail(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get tv recommendations', () {
    final tTvList = TvclilResponse.fromJson(
        json.decode(readJson('dummy_data/tvclil_recommendations.json')))
        .tvList;
    final tId = 1;

    test('should return list of Tv Model when the response code is 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
              .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tvclil_recommendations.json'), 200));
          // act
          final result = await dataSourcetv.getTvRecommendations(tId);
          // assert
          expect(result, equals(tTvList));
        });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourcetv.getTvRecommendations(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('search tv', () {
    final tSearchResult = TvclilResponse.fromJson(
        json.decode(readJson('dummy_data/search_got_tvclil.json')))
        .tvList;
    final tQuery = 'Spiderman';

    test('should return list of tv when response code is 200', () async {
      // arrange
      when(mockHttpClient
          .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/search_got_tvclil.json'), 200));
      // act
      final result = await dataSourcetv.searchTv(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSourcetv.searchTv(tQuery);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });
}