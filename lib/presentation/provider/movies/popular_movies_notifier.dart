import 'package:flutter/foundation.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/movies/movie.dart';
import 'package:sub_bagussh/domain/usecases/movies/get_popular_movies.dart';

class PopularMoviesNotifier extends ChangeNotifier {
  final GetPopularMovies 
  getPopularMovies;

  PopularMoviesNotifier
  (this.getPopularMovies);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularMovies.execute();

    result.fold(
          (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
          (moviesData) {
        _movies = moviesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}