import 'package:sub_bagussh/domain/usecases/tvclil/get_popluar_tvclil.dart';
import 'package:flutter/foundation.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';

class PopularTvclilNotifier extends ChangeNotifier {
  final GetPopularTvclil getPopularTv;

  PopularTvclilNotifier
  (this.getPopularTv);

  RequestState _state 
  = RequestState.Empty;
  RequestState get state 
  => _state;

  List
  <Tvclil> _tv = [];
  List
  <Tvclil> get tv => _tv;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTv
  () async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTv.execute();

    result.fold(
          (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
          (tvData) {
        _tv = tvData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}