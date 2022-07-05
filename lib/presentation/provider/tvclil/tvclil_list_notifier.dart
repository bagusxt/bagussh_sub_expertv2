import 'package:sub_bagussh/domain/usecases/tvclil/get_popluar_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_now_playing_tvclil.dart';

import 'package:flutter/material.dart';
import 'package:sub_bagussh/common/state_enum.dart';

class TvclilListNotifier extends ChangeNotifier {
  var _nowPlayingTv = 
  <Tvclil>[];
  List<Tvclil> 
  get nowPlayingTv => _nowPlayingTv;

  RequestState _nowPlayingTvState = RequestState.Empty;
  RequestState get nowPlayingTvState => _nowPlayingTvState;

  var _popularTv =
   <Tvclil>[];
  List<Tvclil> 
  get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.Empty;
  RequestState get popularTvState => _popularTvState;

  var _topRatedTv = 
  <Tvclil>[];
  List<Tvclil>
  get topRatedTv => _topRatedTv;

  RequestState _topRatedTvState = RequestState.Empty;
  RequestState get topRatedTvState => _topRatedTvState;

  String _message = '';
  String get message => _message;

  TvclilListNotifier({
    required 
    this.getNowPlayingTvclil,
    required 
    this.getPopularTvclil,
    required 
    this.getTopRatedTvclil,
  });

  final GetNowPlayingTvclil 
  getNowPlayingTvclil;
  final GetPopularTvclil 
  getPopularTvclil;
  final GetTopRatedTvclil 
  getTopRatedTvclil;

  Future<void> fetchNowPlayingTv() async {
    _nowPlayingTvState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvclil.execute();
    result.fold(
          (failure) {
        _nowPlayingTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tvData) {
        _nowPlayingTvState = RequestState.Loaded;
        _nowPlayingTv = tvData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvclil.execute();
    result.fold(
          (failure) {
        _popularTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tvData) {
        _popularTvState = RequestState.Loaded;
        _popularTv = tvData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTv() async 
  {
    _topRatedTvState =
    RequestState.Loading;
    notifyListeners();

    final result = 
    await getTopRatedTvclil.execute();
    result.fold(
          (failure) {
        _topRatedTvState = 
        RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tvData) {
        _topRatedTvState =
         RequestState.Loaded;
        _topRatedTv = tvData;
        notifyListeners();
      },
    );
  }
}