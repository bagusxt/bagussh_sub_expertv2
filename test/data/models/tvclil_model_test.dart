import 'package:flutter_test/flutter_test.dart';

import 'package:sub_bagussh/data/models/tvclil/tvclil_model.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

void main() {
  final tTvModel = TvclilModel(
    backdropPath: 
    'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 
    'originalName',
    overview: 
    'overview',
    popularity: 1,
    posterPath: 
    'posterPath',
    firstAirDate: 
    'firstAirDate',
    name: 
    'name',
    voteAverage: 1,
    voteCount: 1,
  );

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

  test('should be a subclass of Tv entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}