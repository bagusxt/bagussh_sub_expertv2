// Mocks generated by Mockito 5.2.0 from annotations
// in sub_bagussh/test/presentation/bloc/tv/tv_airing_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i5;
import 'package:flutter_bloc/flutter_bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sub_bagussh/common/failure.dart' as _i8;
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart' as _i9;
import 'package:sub_bagussh/domain/repositories/tvclil_repository.dart' as _i4;
import 'package:sub_bagussh/domain/usecases/tvclil/get_now_playing_tvclil.dart'
    as _i2;
import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetNowPlayingTvclil_0 extends _i1.Fake
    implements _i2.GetNowPlayingTvclil {}

class _FakeTvOnAirState_1 extends _i1.Fake implements _i3.TvOnAirState {}

class _FakeTvclilRepository_2 extends _i1.Fake implements _i4.TvclilRepository {
}

class _FakeEither_3<L, R> extends _i1.Fake implements _i5.Either<L, R> {}

/// A class which mocks [TvOnAirBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvOnAirBloc extends _i1.Mock implements _i3.TvOnAirBloc {
  MockTvOnAirBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetNowPlayingTvclil get getOnAirTv => (super.noSuchMethod(
      Invocation.getter(#getOnAirTv),
      returnValue: _FakeGetNowPlayingTvclil_0()) as _i2.GetNowPlayingTvclil);
  @override
  _i3.TvOnAirState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeTvOnAirState_1()) as _i3.TvOnAirState);
  @override
  _i6.Stream<_i3.TvOnAirState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.TvOnAirState>.empty())
          as _i6.Stream<_i3.TvOnAirState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i3.TvOnAirEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i3.TvOnAirEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i3.TvOnAirState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i3.TvOnAirEvent>(
          _i7.EventHandler<E, _i3.TvOnAirState>? handler,
          {_i7.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i7.Transition<_i3.TvOnAirEvent, _i3.TvOnAirState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i3.TvOnAirState>? change) =>
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

/// A class which mocks [GetNowPlayingTvclil].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingTvclil extends _i1.Mock
    implements _i2.GetNowPlayingTvclil {
  MockGetNowPlayingTvclil() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvclilRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvclilRepository_2()) as _i4.TvclilRepository);
  @override
  _i6.Future<_i5.Either<_i8.Failure, List<_i9.Tvclil>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i5.Either<_i8.Failure, List<_i9.Tvclil>>>.value(
              _FakeEither_3<_i8.Failure, List<_i9.Tvclil>>())) as _i6
          .Future<_i5.Either<_i8.Failure, List<_i9.Tvclil>>>);
}
