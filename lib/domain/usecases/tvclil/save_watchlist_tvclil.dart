import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';

import 'package:dartz/dartz.dart';

class 
  SaveWatchlistTvclil
{

  final 
     TvclilRepository 
       repository;

  SaveWatchlistTvclil
  (
    this.repository
  );

  Future
    <Either

  <Failure, 
    String>> 
      execute

  (
    TvclilDetail tv
  ) 
{
  return 
    repository.saveWatchlistTv
    (
      tv
    );
  }
}