import 'package:sub_bagussh/domain/entities/movies/movie_detail.dart';
import 'package:sub_bagussh/domain/repositories/movie_repository.dart';
import 'package:sub_bagussh/common/failure.dart';

import 'package:dartz/dartz.dart';

class RemoveWatchlist {
  final 
  MovieRepository 
  repository;

  RemoveWatchlist
  (this.repository);

  Future<Either<Failure,
   String>> 
   execute(MovieDetail movie) 
  {
    return repository.removeWatchlist(movie);
  }
}