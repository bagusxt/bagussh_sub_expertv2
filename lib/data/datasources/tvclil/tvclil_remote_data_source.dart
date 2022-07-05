import 'package:sub_bagussh/data/models/tvclil/tvclil_response.dart';
import 'package:sub_bagussh/common/exception.dart';

import 'package:sub_bagussh/data/models/tvclil/tvclil_detail_model.dart';
import 'package:sub_bagussh/data/models/tvclil/tvclil_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TvclilRemoteDataSource 
{
  Future<List<TvclilModel>> 
  getNowPlayingTv();

  Future<List<TvclilModel>> 
  getPopularTv();

  Future<List<TvclilModel>> 
  getTopRatedTv();

  Future<TvclilDetailResponse> 
  getTvDetail(int id);

  Future<List<TvclilModel>> 
  getTvRecommendations(int id);
  
  Future<List<TvclilModel>> 
  searchTv(String query);
}

class TvclilRemoteDataSourceImpl implements TvclilRemoteDataSource 
{
  static const API_KEY = 
 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 
 'https://api.themoviedb.org/3';

  final http.Client client;

  TvclilRemoteDataSourceImpl
 ({required this.client});

  @override
  Future<List<TvclilModel>>
  getNowPlayingTv() async 
  {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200)
    {
      return TvclilResponse.fromJson(json.decode(response.body)).tvList;
    } 
      else
    {
      throw ServerException();
    }
  }

  @override
  Future<TvclilDetailResponse> 
  getTvDetail(int id) async 
  {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if 
    (response.statusCode == 200) 
    {
      return TvclilDetailResponse.fromJson(json.decode(response.body));
    } 
    else 
    {
      throw ServerException();
    }
  }

  @override
  Future<List<TvclilModel>>
  getTvRecommendations(int id) async 
  {
    final response = await client
      .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) 
    {
      return TvclilResponse.fromJson(json.decode(response.body)).tvList;
    } 
      else 
    {
      throw ServerException();
    }
  }

  @override
  Future<List<TvclilModel>> 
  getPopularTv() async 
  {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) 
    {
      return TvclilResponse.fromJson(json.decode(response.body)).tvList;
    } 
      else 
    {
      throw ServerException();
    }
  }

  @override
  Future<List<TvclilModel>> 
  getTopRatedTv() async 
  {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) 
    {
      return TvclilResponse.fromJson(json.decode(response.body)).tvList;
    }
      else 
    {
      throw ServerException();
    }
  }

  @override
  Future<List<TvclilModel>> 
  searchTv(String query) async 
  {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) 
    {
      return TvclilResponse.fromJson(json.decode(response.body)).tvList;
    }
      else 
    {
      throw ServerException();
    }
  }
}