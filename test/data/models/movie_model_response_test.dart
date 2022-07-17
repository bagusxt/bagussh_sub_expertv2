import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub_bagussh/data/models/movies/movie_model.dart';
import 'package:sub_bagussh/data/models/movies/movie_response.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';

import '../../json_reader.dart';

void main() {
  final tMovieModel
   = MovieModel(
    adult: 
    false,

    backdropPath: 
    'backdropPath',

    genreIds: [1, 2, 3],
    id: 1,

    originalTitle:
    'originalTitle',

    overview: 
    'overview',

    popularity: 1,
    posterPath: 

    'posterPath',
    releaseDate: 

    'releaseDate',

    title: 
    'title',

    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovie = Movie(
    adult: false,
    backdropPath: 
    'backdropPath',

    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 
    'originalTitle',

    overview: 
    'overview',

    popularity: 1,
    posterPath: 

    'posterPath',
    releaseDate: 

    'releaseDate',
    title: 

    'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Movie entity', () async 
  {
    final result 
      = tMovieModel.toEntity();

    expect
      (result, tMovie);
  });
}

//movie_response_model_testdrt
void private() {
  final tMovieModel
   = MovieModel(

    adult: false,
    backdropPath: 

    "/path.jpg",
    genreIds: [1, 2, 3, 4],

    id: 1,
    originalTitle: 
    "Original Title",

    overview: 
    "Overview",

    popularity: 1.0,
    posterPath: 

    "/path.jpg",
    releaseDate: 

    "2020-05-05",
    title: 
    "Title",

    video: false,
    voteAverage: 1.0,
    voteCount: 1,
  );
  final tMovieResponseModel =
  MovieResponse
    (movieList: 
      <MovieModel>
        [tMovieModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final 
        Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/now_playing.json'));
      // act
      final result = 
        MovieResponse.fromJson(jsonMap);
      // assert
      expect
        (result, tMovieResponseModel);
      }
      );
    }
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result
         = tMovieResponseModel.toJson();
      // assert
      final 
        expectedJsonMap = {

        "results": [
          {
            "adult": false,
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],

            "id": 1,
            "original_title": "Original Title",
            "overview": "Overview",

            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "release_date": "2020-05-05",

            "title": "Title",
            "video": false,

            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };
      expect
        (result, expectedJsonMap);
    });
  });
}