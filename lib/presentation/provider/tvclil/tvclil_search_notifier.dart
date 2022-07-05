import 'package:flutter/foundation.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/search_tvclil.dart';
import 'package:sub_bagussh/common/state_enum.dart';

class TvclilSearchNotifier extends ChangeNotifier {
  final SearchTvclil searchTv;

  TvclilSearchNotifier
  ({required this.searchTv});

  RequestState _state = 
  RequestState.Empty;
  RequestState get state 
  => _state;

  List
  <Tvclil> _searchTvResult = [];
  List
  <Tvclil> get searchTvResult => _searchTvResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSearch(String query) async {
    _state =
    RequestState.Loading;
    notifyListeners();

    final result = 
    await searchTv.execute(query);
    result.fold(
          (failure) {
        _message =
         failure.message;
        _state =
         RequestState.Error;
        notifyListeners();
      },
          (data) {
        _searchTvResult =
         data;
        _state = 
        RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}