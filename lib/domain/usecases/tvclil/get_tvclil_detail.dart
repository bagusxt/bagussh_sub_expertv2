import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';

import 'package:dartz/dartz.dart';

class GetTvclilDetail 
{
  final 
  TvclilRepository
  repository;

  GetTvclilDetail
  (this.repository);

  Future<Either<Failure, 
  TvclilDetail>> 
  execute(int id) {
  return repository.getTvDetail(id);
  }
}