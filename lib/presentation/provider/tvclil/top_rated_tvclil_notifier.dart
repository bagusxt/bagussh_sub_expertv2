import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:flutter/foundation.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

class TopRatedTvclilNotifier extends ChangeNotifier 
{
  final GetTopRatedTvclil getTopRatedTv;

  TopRatedTvclilNotifier
  ({required this.getTopRatedTv});

  RequestState _state =
   RequestState.Empty;
  RequestState get state 
  => _state;

  List
  <Tvclil> _tv = [];
  List
  <Tvclil> get tv => _tv;

  String _message = '';
  String get message => _message;

  Future<void> 
  fetchTopRatedTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = 
    await getTopRatedTv.execute();

    result.fold(
          (failure) {
        _message 
        = failure.message;
        _state 
        = RequestState.Error;
        notifyListeners();
      },
          (tvData) {
        _tv 
        = tvData;
        _state
        = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}