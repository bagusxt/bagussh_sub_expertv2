// Mocks generated by Mockito 5.2.0 from annotations
// in sub_bagussh/test/presentation/bloc/movie/recommend_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i5;
import 'package:flutter_bloc/flutter_bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sub_bagussh/common/failure.dart' as _i8;
import 'package:sub_bagussh/domain/entities/movies/movie.dart' as _i9;
import 'package:sub_bagussh/domain/repositories/movie_repository.dart' as _i4;
import 'package:sub_bagussh/domain/usecases/movies/get_movie_recommendations.dart'
    as _i2;
import 'package:sub_bagussh/presentation/bloc/movie/movie_bloc.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetMovieRecommendations_0 extends _i1.Fake
    implements _i2.GetMovieRecommendations {}

class _FakeMovieRecommendationState_1 extends _i1.Fake
    implements _i3.MovieRecommendationState {}

class _FakeMovieRepository_2 extends _i1.Fake implements _i4.MovieRepository {}

class _FakeEither_3<L, R> extends _i1.Fake implements _i5.Either<L, R> {}

/// A class which mocks [MovieRecommendationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRecommendationBloc extends _i1.Mock
    implements _i3.MovieRecommendationBloc {
  MockMovieRecommendationBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMovieRecommendations get getMovieRecommendations =>
      (super.noSuchMethod(Invocation.getter(#getMovieRecommendations),
              returnValue: _FakeGetMovieRecommendations_0())
          as _i2.GetMovieRecommendations);
  @override
  _i3.MovieRecommendationState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeMovieRecommendationState_1())
          as _i3.MovieRecommendationState);
  @override
  _i6.Stream<_i3.MovieRecommendationState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.MovieRecommendationState>.empty())
          as _i6.Stream<_i3.MovieRecommendationState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i3.MovieRecommendationEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i3.MovieRecommendationEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i3.MovieRecommendationState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i3.MovieRecommendationEvent>(
          _i7.EventHandler<E, _i3.MovieRecommendationState>? handler,
          {_i7.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i7.Transition<_i3.MovieRecommendationEvent,
                  _i3.MovieRecommendationState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i3.MovieRecommendationState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}

/// A class which mocks [GetMovieRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieRecommendations extends _i1.Mock
    implements _i2.GetMovieRecommendations {
  MockGetMovieRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_2()) as _i4.MovieRepository);
  @override
  _i6.Future<_i5.Either<_i8.Failure, List<_i9.Movie>>> execute(dynamic id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i5.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_3<_i8.Failure, List<_i9.Movie>>())) as _i6
          .Future<_i5.Either<_i8.Failure, List<_i9.Movie>>>);
}