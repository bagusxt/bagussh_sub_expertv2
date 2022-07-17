part of 
'tv_bloc.dart';

//tv_dtl

class 
TvDetailError 

extends 
TvDetailState {

  final 
  String 

  message;
    TvDetailError(
       this.message);

  @override
      List<Object> 
            get props 
              => [message];
}

abstract class 
  TvDetailState 

extends
   Equatable {


  @override
  List
    <Object> 
        get props => [

  ];
}


class 
TvDetailEmpty 

extends 
TvDetailState {

 @override
  List
    <Object> 
      get props => [

   ];
}

class
  TvDetailLoading 

extends 
  TvDetailState {

 @override
  List

    <Object> 
      get props => [
      
  ];
}

class 
  TvDetailLoaded 
  
  extends 
    TvDetailState {
  
  final
     TvclilDetail 
      tvDetail;

  TvDetailLoaded
      (this.tvDetail);

  @override

  List<Object>
    get props =>
       [tvDetail];
}


//src
abstract
   class 
    TvSearchState 
      extends 

Equatable {

  const
     TvSearchState(
);

  @override 
    List<Object>
      get props => [
  ];
}

class 
  TvSearchEmpty 

  extends 
    TvSearchState {

}

class 
TvSearchLoading 

extends 
TvSearchState {

}

class 
TvSearchError 

extends
TvSearchState {
  
  final 

  String
  message;

  const 
    TvSearchError
      (this.message);

  @override
    List<Object> 
        get props => [message];
}

class 
TvSearchLoaded 

extends 
TvSearchState {

  final 
    List

      <Tvclil> 
        result;

  const 
    TvSearchLoaded
      (this.result);

  @override
    List<Object> 
      get props 
          => [result];
}

//top
abstract 
  class 

TvTopRatedState
   extends

 Equatable 
 {
  const
     TvTopRatedState(
);

  @override
     List
      <Object> 
          get props => [
  ];
}

class 
  TvTopRatedEmpty 
  
  extends
     TvTopRatedState {
 }

class 
  TvTopRatedLoading
  
   extends 
    TvTopRatedState {
}

class 
  TvTopRatedError 
  
extends 
  TvTopRatedState {

  final 
   String
     message;

  const 
    TvTopRatedError
      (this.message);

  @override
  List<Object> 
      get props =>
  [
    message
  ];
}

class 
TvTopRatedLoaded 

extends 
TvTopRatedState {

  final 
    List
      <Tvclil>
        result;

  const 
    TvTopRatedLoaded
      (this.result);

  @override
  List
    <Object>
       get props => 
        [result
  ];
}

//populuar
abstract class TvPopularState extends Equatable {
  const TvPopularState();

  @override
  List<Object> get props => [];
}

class TvPopularEmpty extends TvPopularState {}

class TvPopularLoading extends TvPopularState {}

class TvPopularError extends TvPopularState {
  final String message;

  const TvPopularError(this.message);

  @override
  List<Object> get props => [message];
}

class TvPopularLoaded extends TvPopularState {
  final List<Tvclil> result;

  const TvPopularLoaded(this.result);

  @override
  List<Object> get props => [result];
}

//recom

abstract class

 TvRecommendationState 

 extends Equatable {

  const TvRecommendationState();

  @override

  List<Object> 
      get props => [];
}

class
   TvRecommendationEmpty 


   extends 
    TvRecommendationState {
}

class 
  TvRecommendationLoading 
  
  extends 
    TvRecommendationState {
}

class 
  TvRecommendationError 

  extends 
    TvRecommendationState {

  final 
    String message;

  const 
    TvRecommendationError
        (this.message);

  @override

  List<Object>
     get props => [message
  ];
}

class 
  TvRecommendationLoaded 

  extends
     TvRecommendationState {
  final List<Tvclil>
  tv;

  const TvRecommendationLoaded(this.tv);  @override List<Object> get props =>
  [tv];
}

//airing
abstract class TvOnAirState extends Equatable {const TvOnAirState();

@override List<Object> get props => [

  ];
}

class
 TvOnAirEmpty 

 extends 
  TvOnAirState {
}

class 
    TvOnAirLoading 
    
  extends 
    TvOnAirState {
}

class TvOnAirError extends TvOnAirState {final String message;

  const TvOnAirError(this.message); @override  List<Object> get props => [message];
}

class TvOnAirLoaded extends TvOnAirState { final List<Tvclil> result; const TvOnAirLoaded(this.result);

@override 
  List<Object>

    get props => 
      [result
  ];
  
}