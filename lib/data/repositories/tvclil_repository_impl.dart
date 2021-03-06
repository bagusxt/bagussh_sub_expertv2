import 'package:sub_bagussh/common/exception.dart';
import 'package:sub_bagussh/common/failure.dart';
import 'package:sub_bagussh/data/models/tvclil/tvclil_table.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart';
import 'package:sub_bagussh/data/datasources/tvclil/tvclil_local_data_source.dart';
import 'package:sub_bagussh/data/datasources/tvclil/tvclil_remote_data_source.dart';

import 'dart:io';
import 'package:dartz/dartz.dart';

class 
  TvclilRepositoryImpl 
  
implements 
  TvclilRepository 

{
 
final 
  TvclilRemoteDataSource 

remoteDataSource;
  final 

TvclilLocalDataSource 
  localDataSource;

TvclilRepositoryImpl(
{
  required 
    this.remoteDataSource,

  required 
    this.localDataSource,

  }

);

@override

Future
  <Either
    <Failure, 
      List<Tvclil>>>getNowPlayingTv
      
() async 

{
  
try 

{
  final 
    result = 

  await 
    remoteDataSource.getNowPlayingTv();

  return 
    Right
      (result.map((model)

 => model.toEntity
      ()).toList());

    } 

    on 
      ServerException 
    {

    return 
      Left
        (ServerFailure(''));
    } 

    on
       SocketException 
    {

    return 
        Left
          (ConnectionFailure
            ('Failed to connect to the network'));

    }
    on 
      TlsException
    {

    return 
      Left
        (SslFailure
          ('Certificate unvalid'));
  }
}


@override

Future
  <Either
    <Failure, 
      TvclilDetail>>getTvDetail(int id) 
      
async{

  try
  {
      
 final 
  result = 
  
 await 
    remoteDataSource.getTvDetail(id);


 return 
  Right
    (result.toEntity());
    
} 


  on 
    ServerException 

  {
  return 
    Left
      (ServerFailure(''));
      
  } 

  on 
    SocketException 

  {
      
  return
   Left
    (ConnectionFailure
      ('Failed to connect to the network'));

  }

  on 
    TlsException 

  {

  return 
    Left
      (SslFailure
        ('Certificate unvalid')
  );
}
  
  }

@override

Future
  <Either
    <Failure, 
      List
        <Tvclil>>> getTvRecommendations(int id) 
        
async{

try 

  {
  final 
    result = 

  await 
    remoteDataSource.getTvRecommendations(id);

  return 
    Right
      (result.map
        ((model) => 

  model.toEntity
    ()).toList());

  } 
  on 
    ServerException 
  {

  return 
    Left
      (ServerFailure(''));

  }
  on 
    SocketException {

  return 
    Left
      (ConnectionFailure
        ('Failed to connect to the network'));
    }
    
    on 
      TlsException 
    {
      
    return 
      Left
        (SslFailure
          ('Certificate unvalid')
    );
  }
}

@override

Future
  <Either
    <Failure, 
      List
        <Tvclil>>>getPopularTv

() async 

{

try 

    {
    final 
      result = 

    await 
      remoteDataSource.getPopularTv();

    return 
      Right
        (result.map
          ((model) => 
            model.toEntity
                ()).toList());

    } 
    
    on 
      ServerException 
    {

      return 
        Left
          (ServerFailure(''));

    } 

    on
     SocketException

    {

    return 
      Left
        (ConnectionFailure
          ('Failed to connect to the network')
  );
}
    on 
      TlsException 

   {
      return 
        Left
          (SslFailure
            ('Certificate unvalid')
    );
  }
}

 @override

Future
  <Either
    <Failure,
       List
        <Tvclil>>> getTopRatedTv

() async 

{
  
try 

  {
  final 
    result = 
      await remoteDataSource.getTopRatedTv();

    return 
      Right
        (result.map((model) 
          => model.toEntity()).toList());
    } 

    on 
      ServerException

    {
      
    return 
      Left
        (ServerFailure(''));
    }

    on 
      SocketException 

    {

    return 
      Left
        (ConnectionFailure
          ('Failed to connect to the network'));

    }
       
    on 
      TlsException

    {
      return 
        Left
          (SslFailure
            ('Certificate unvalid')
    );
  }
}

@override

Future
  <Either
    <Failure, 
      List
        <Tvclil>>> searchTv(String query)
        
async

{

try 

  {
  final 
    result = 
    
  await 
    remoteDataSource.searchTv(query);
     
  return 
    Right
      (result.map((model) => 
         model.toEntity()).toList());
         
  } 
  on 
    ServerException 
  {  
  return 
      Left
        (ServerFailure(''));   
  } 
  on 
    SocketException {

  return
     Left
      (ConnectionFailure
        ('Failed to connect to the network'));
    }
    on 
      TlsException {

    return 
      Left
        (SslFailure
          ('Certificate unvalid')
    );
  }
}

@override

Future
  <Either
    <Failure, 
      String>>saveWatchlistTv(TvclilDetail tv) 
      
async{

try 

{

final 
  result =
  
await 
  localDataSource.insertWatchlistTv
    (TvclilTable.fromEntity(tv));

return 
  Right
    (result);
 } 
  on 
    DatabaseException
    catch (e)

 {
  return 
    Left
      (DatabaseFailure
        (e.message));
        
 } 
   catch (e) 

 {

   throw e;

  }
}

@override

Future
  <Either
    <Failure, 
      String>> 
        removeWatchlistTv
          (TvclilDetail tv) 

async {

try 

{
final
 result =

await 
  localDataSource.removeWatchlistTv
  (TvclilTable.fromEntity(tv));

return 
  Right
    (result);

 } 
 on 
  DatabaseException 
    catch (e) 

  {
  return 
    Left
      (DatabaseFailure
      (e.message)
    );
   }
  }

  @override

  Future
    <bool>
       isAddedToWatchlistTv(int id) 

async{

  final 
    result = 
    
  await 
    localDataSource.getTvById(id);

  return 
    result 
      != null;
}


  @override
  
  Future
    <Either
      <Failure, 
        List
          <Tvclil>>> getWatchlistTv()
  
async 

{
  final 
    result = 

  await 
    localDataSource.getWatchlistTv();

  return 
    Right
      (result.map((data)

    => data.toEntity
        ()).toList());
  }

}