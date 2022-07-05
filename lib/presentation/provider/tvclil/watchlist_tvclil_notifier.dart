import 'package:flutter/foundation.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_tvclil.dart';
import 'package:sub_bagussh/common/state_enum.dart';

class WatchlistTvclilNotifier extends ChangeNotifier {
  var _watchlistTv = <Tvclil>[];
  List
  <Tvclil> 
  get watchlistTv 
  => _watchlistTv;

  var _watchlistTvState = RequestState.Empty;
  RequestState get watchlistTvState => _watchlistTvState;

  String _message = '';
  String get message => _message;

  WatchlistTvclilNotifier({required this.getWatchlistTv});

  final GetWatchlistTvclil getWatchlistTv;

  Future<void> fetchWatchlistTv() async {
    _watchlistTvState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
          (failure) {
        _watchlistTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tvData) {
        _watchlistTvState = RequestState.Loaded;
        _watchlistTv = tvData;
        notifyListeners();
      },
    );
  }
}