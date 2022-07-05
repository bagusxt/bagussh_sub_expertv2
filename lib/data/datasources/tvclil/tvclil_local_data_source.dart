import 'package:sub_bagussh/data/datasources/db/database_helper_tvclil.dart';
import 'package:sub_bagussh/common/exception.dart';

import 'package:sub_bagussh/data/models/tvclil/tvclil_table.dart';

abstract class TvclilLocalDataSource 
{
  Future<String>
  insertWatchlistTv
  (TvclilTable tv);

  Future<String> 
  removeWatchlistTv
  (TvclilTable tv);

  Future<TvclilTable?>
  getTvById(int id);

  Future<List<TvclilTable>> 
  getWatchlistTv();
}

class TvclilLocalDataSourceImpl implements TvclilLocalDataSource 
{
  final DatabaseHelperTvclil databaseHelpertvclil;

  TvclilLocalDataSourceImpl
  ({required this.databaseHelpertvclil});

  @override
  Future<String>
  insertWatchlistTv(TvclilTable tv) async 
  {
    try 
    {
      await databaseHelpertvclil.insertWatchlistTv(tv);
      return 'Added to Watchlist';
    } 
      catch (e) 
    {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> 
  removeWatchlistTv(TvclilTable tv) async
   {
    try 
    {
      await databaseHelpertvclil.removeWatchlistTv(tv);
      return 'Removed from Watchlist';
    } 
      catch (e)
    {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvclilTable?>
  getTvById(int id) async
  {
    final result = await databaseHelpertvclil.getTvById(id);
    if 
    (result != null) 
    {
      return TvclilTable.fromMap(result);
    } 
    else 
    {
      return null;
    }
  }

  @override
  Future<List<TvclilTable>>
  getWatchlistTv() async 
  {
    final result = 
    await databaseHelpertvclil.getWatchlistTv();
    return result.map((data) =>
    TvclilTable.fromMap(data)).toList();
  }
}