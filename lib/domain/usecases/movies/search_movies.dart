import 'package:sub_bagussh/domain/repositories/movie_repository.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/common/failure.dart';

import 'package:dartz/dartz.dart';

class 
  SearchMovies 

{
  final 

   MovieRepository 
      repository;

  SearchMovies
  (
    this.repository
  );

  Future
    <Either

  <Failure, 
    List

  <Movie>>> 
     execute
     
     (

      String query

     ) 
     {
  return 
    repository.searchMovies
    (
      query
    );
  }
}