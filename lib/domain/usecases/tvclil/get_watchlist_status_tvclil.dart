import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';

class
   GetWatchListStatusTvclil 
{
  
  final
    TvclilRepository 

  repository;
    GetWatchListStatusTvclil

(
  this.repository
);

  Future
    <bool> 

  execute
  (
    int id
  ) 

async{
    return 
      repository.isAddedToWatchlistTv
  (
    id
  );
  
  }
  
}