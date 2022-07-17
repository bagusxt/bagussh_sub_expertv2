import 'package:sub_bagussh/common/failure.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';

import 'package:dartz/dartz.dart';

class 
  GetWatchlistTvclil 
{

  final 
    TvclilRepository 
      _repository;

  GetWatchlistTvclil
  (
    this
      ._repository
  );

  Future
    <Either
    
  <Failure, 
    List

  <Tvclil>>> 
    execute()
  {
  return 
    _repository
      .getWatchlistTv(

    );
  }
}