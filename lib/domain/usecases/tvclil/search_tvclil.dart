import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

import 'package:dartz/dartz.dart';

class SearchTvclil {
  final 
  TvclilRepository 
  repository;

  SearchTvclil
  (this.repository);

  Future<Either<Failure, 
  List<Tvclil>>> 
  execute(String query) {
  return repository.searchTv(query);
  }
}