import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

import 'package:sub_bagussh/common/failure.dart';

import 'package:dartz/dartz.dart';

class 
  GetTvclilRecommendations 
{

final 
  TvclilRepository
     repository;

GetTvclilRecommendations
(
  this.repository
);

Future
  <Either

<Failure, 
  List

<Tvclil>>> 
  execute
(
    id
) 

{
  return
     repository.getTvRecommendations
(
      id
    );
  }
  
}