import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'package:sub_bagussh/data/datasources/db/database_helper.dart';
import 'package:sub_bagussh/data/datasources/movie/movie_local_data_source.dart';
import 'package:sub_bagussh/data/datasources/movie/movie_remote_data_source.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec
  <http.Client>
  (as: #MockHttpClient)
])
void main() {}