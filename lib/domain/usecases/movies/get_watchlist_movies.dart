import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';
import 'package:sub_bagussh/common/failure.dart';

import 'package:dartz/dartz.dart';

class 
  GetWatchlistMovies 
{
  final 
    MovieRepository 
      _repository;

  GetWatchlistMovies
  (
    this._repository
  );

  Future
    <Either

  <Failure, 
    List

  <Movie>>> 
    execute() {
  return 
    _repository.getWatchlistMovies();

  }
  
}