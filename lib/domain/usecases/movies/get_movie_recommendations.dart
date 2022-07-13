import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';
import 'package:sub_bagussh/common/failure.dart';

import 'package:dartz/dartz.dart';

class 
  GetMovieRecommendations 
{
  
  final 
   MovieRepository 
    repository;

  GetMovieRecommendations
  (
    this.repository
  );

  Future
    <Either

  <Failure, 
    List

  <Movie>>> execute
  (
    id
  ) 

  {
    return 
      repository.getMovieRecommendations
      (id);
  }

}