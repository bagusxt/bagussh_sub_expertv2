import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

import 'package:dartz/dartz.dart';

abstract class TvclilRepository 
{
  Future<Either<Failure, 
  List<Tvclil>>> 
  getNowPlayingTv();

  Future<Either<Failure, 
  List<Tvclil>>> 
  getPopularTv();

  Future<Either<Failure, 
  List<Tvclil>>> 
  getTopRatedTv();

  Future<Either<Failure, 
  TvclilDetail>>
  getTvDetail(int id);

  Future<Either<Failure, 
  List<Tvclil>>> 
  getTvRecommendations(int id);

  Future<Either<Failure, 
  List<Tvclil>>> 
  searchTv(String query);

  Future<Either<Failure, 
  String>> 
  saveWatchlistTv(TvclilDetail tv);

  Future<Either<Failure, 
  String>> 
  removeWatchlistTv(TvclilDetail tv);

  Future<bool> 
  isAddedToWatchlistTv(int id);
  Future<Either<Failure, 
  List<Tvclil>>> getWatchlistTv();
}