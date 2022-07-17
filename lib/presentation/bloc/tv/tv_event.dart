part of 
'tv_bloc.dart';

//tv_dtl

class 
  GetTvDetailEvent 

extends 
  TvDetailEvent
{
  final 
    int
       id;
 
  @override
    List<Object> 
      get props => [id];

  GetTvDetailEvent
    (this.id);
}

abstract class 
  TvDetailEvent 

      extends 
          Equatable {
}

//src

abstract 
  class 
  
TvSearchEvent 
  extends 

Equatable { const 

  TvSearchEvent(

);

  @override

  List
    <Object> 
      get 
        props => [
        
  ];
}

class 

  TvSearchSetEmpty

extends 

  TvSearchEvent {

}

class 
  TvSearchQueryEvent 
  
extends 
  TvSearchEvent 
{

  final 
    String 
      query;

  const
     TvSearchQueryEvent
        (this.query);

  @override
      List
          <Object> 
              get props => [];
}

//top

abstract 
  class 

TvTopRatedEvent 
  extends 
    Equatable {

  const 
    TvTopRatedEvent(
    );

  @override
  List
    <Object> 
        get props => [
  ];
}

class 
  TvTopRatedGetEvent 
  
  extends 
    TvTopRatedEvent {

  }

//poplaur

abstract
   class 
    TvPopularEvent 

  extends 
    Equatable {
        const 
          TvPopularEvent(
);

  @override
   List
    <Object> 
      get props => [
  ];
}

class 
  TvPopularGetEvent 
  
    extends 
      TvPopularEvent {

 }

//recom

abstract class 
  TvRecommendationEvent 

extends 
  Equatable {

    const
      TvRecommendationEvent(

);

  @override
  List

    <Object> 
      get props => [

  ];
}

class 
  GetTvRecommendationEvent
  
   extends 
    TvRecommendationEvent {

  final 
    int 
      id;

  const 
    GetTvRecommendationEvent
      (this.id);

  @override
  List
    <Object>
      get props => [    
  ];
}

//airing

abstract 
  class 
    TvOnAirEvent 

  extends 
    Equatable {

  const 
    TvOnAirEvent(

);

  @override
  List<Object> get props => [];
}

class 
    TvOnAirGetEvent 
    
  extends 
    TvOnAirEvent {

}