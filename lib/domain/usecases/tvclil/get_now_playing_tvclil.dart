import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';

import 'package:dartz/dartz.dart';

class 
 GetNowPlayingTvclil 
  {

  final 
    TvclilRepository 
     repository;

  GetNowPlayingTvclil
  (
    this
      .repository
  );

  Future
    <Either

  <Failure, 
    List

  <Tvclil>>> 
    execute() 
  {
  return 
    repository.getNowPlayingTv(

    );
  }
  
}