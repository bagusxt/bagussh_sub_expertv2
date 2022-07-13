import 'package:sub_bagussh/domain/entities/movies/movie_detail.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';
import 'package:sub_bagussh/common/failure.dart';

import 'package:dartz/dartz.dart';

class 
  GetMovieDetail 
{

final 
  MovieRepository 
     repository;

  GetMovieDetail
  (
    this.repository
  );

  Future
    <Either

  <Failure, 
    MovieDetail>> 
    
  execute
  (
    int id
  ) 

{
  return 
    repository.getMovieDetail
    (id);

  }
}