import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';

import 'package:dartz/dartz.dart';

class 
  GetTopRatedMovies 
{

  final 
   MovieRepository 
     repository;

  GetTopRatedMovies
  (
    this.repository
  );

  Future
    <Either

  <Failure, 
    List

  <Movie>>> 
    execute() 
  {

  return 
    repository
      .getTopRatedMovies
        (
          
        );
  }

}