import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_detail.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_recomendations.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_status_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/remove_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/save_watchlist_tvclil.dart';

class TvclilDetailNotifier extends ChangeNotifier {
  static const 
  watchlistAddSuccessMessage = 'Added to Watchlist';
  static const 
  watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvclilDetail 
  getTvclilDetail;

  final GetTvclilRecommendations 
  getTvclilRecommendations;

  final GetWatchListStatusTvclil 
  getWatchListStatusTvclil;

  final SaveWatchlistTvclil 
  saveWatchlistTvclil;

  final RemoveWatchlistTvclil 
  removeWatchlistTvclil;

  TvclilDetailNotifier({
    required 
    this.getTvclilDetail,
    required 
    this.getTvclilRecommendations,
    required 
    this.getWatchListStatusTvclil,
    required 
    this.saveWatchlistTvclil,
    required 
    this.removeWatchlistTvclil,
  });

  late TvclilDetail _tv;
  TvclilDetail get tv => _tv;

  RequestState _tvState
  = RequestState.Empty;

  RequestState get tvState 
  => _tvState;

  List<Tvclil>
   _tvRecommendations = [];

  List<Tvclil> 
  get tvRecommendations => _tvRecommendations;

  RequestState
   _recommendationTvState = RequestState.Empty;

  RequestState
   get recommendationTvState => _recommendationTvState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlistTv = false;
  bool get isAddedToWatchlistTv => _isAddedtoWatchlistTv;

  Future<void> fetchTvDetail(int id) async {
    _tvState = RequestState.Loading;
    notifyListeners();
    final detailResult =
     await getTvclilDetail.execute(id);
    final recommendationResult =
     await getTvclilRecommendations.execute(id);
    detailResult.fold(
          (failure) {
        _tvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tv) {
        _recommendationTvState = RequestState.Loading;
        _tv = tv;
        notifyListeners();
        recommendationResult.fold(
              (failure) {
            _recommendationTvState = RequestState.Error;
            _message = failure.message;
          },
              (tv) {
            _recommendationTvState = RequestState.Loaded;
            _tvRecommendations = tv;
          },
        );
        _tvState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessageTv = '';
  String get watchlistMessageTv => _watchlistMessageTv;

  Future<void> addWatchlistTv(TvclilDetail tv) async {
    final result = await saveWatchlistTvclil.execute(tv);

    await result.fold(
          (failure) async {
        _watchlistMessageTv = failure.message;
      },
          (successMessage) async {
        _watchlistMessageTv = successMessage;
      },
    );

    await loadWatchlistStatusTv(tv.id);
  }

  Future<void> 
  removeFromWatchlistTv(TvclilDetail tv) async {
    final result 
    = await removeWatchlistTvclil.execute(tv);

    await result.fold(
          (failure) async {
        _watchlistMessageTv = failure.message;
      },
          (successMessage) async {
        _watchlistMessageTv = successMessage;
      },
    );

    await loadWatchlistStatusTv(tv.id);
  }

  Future<void> 
  loadWatchlistStatusTv(int id) async {
    final result = 
    await getWatchListStatusTvclil.execute(id);
    _isAddedtoWatchlistTv
     = result;
    notifyListeners();
  }
}