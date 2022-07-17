part of 
'movie_bloc.dart';


class 
  MovieDetailEmpty 

extends 
  MovieDetailState 
{
  @override List<Object> get props => [];
}

class 
  MovieDetailLoading 

extends 
  MovieDetailState 
{
 @override List<Object> get props => [];
}

class 
  MovieDetailLoaded 

extends 
  MovieDetailState 

{ 
  final 
   MovieDetail 
     movieDetail;

   MovieDetailLoaded
     (this.movieDetail);

  @override List<Object> get props => [movieDetail];
}

class 
  MovieDetailError 

extends 
  MovieDetailState

 {

  final 
    String message;
       MovieDetailError(this.message);

  @override List<Object> get props => [message];
}

abstract class 
  MovieDetailState 
    extends Equatable {
}


abstract class
   MovieSearchState 
    extends Equatable {const MovieSearchState(
);

@override List<Object> get props => [];

}

class 
  MovieSearchEmpty 

extends 
  MovieSearchState {
}

class 
  MovieSearchLoading

 extends 
    MovieSearchState {
}

class 
  MovieSearchError 

extends 
  MovieSearchState {
  
final 
    String message;

const 
    MovieSearchError(this.message);

    @override List<Object> get props => [message];
}

class 
 MovieSearchLoaded 
 
extends
 MovieSearchState {

  final List
    <Movie>
       result;

  const 
    MovieSearchLoaded
    (this.result);

  @override
  
  List<Object>
     get props 
      => [result];
}

abstract class 
  MovieTopRatedState 
    extends Equatable {
}

class MovieTopRatedEmpty 
  extends MovieTopRatedState {

  @override
     List<Object>
      get props => [];

}

class 

  MovieTopRatedLoading 

  extends 

MovieTopRatedState

{
  @override List<Object> get props => [];
}

class
  MovieTopRatedError 

extends
 MovieTopRatedState {

final
  String message;
 @override

MovieTopRatedError
  (this.message);
     List<Object>
       get props => []; 
}

class 
  MovieTopRatedLoaded 
    extends 
      MovieTopRatedState 
{

  final 
    List<Movie>
       result;

  MovieTopRatedLoaded
    (this.result);

  @override
  List<Object> 

  get props =>
  [result];

}

 abstract class 
  MoviePopularState 
  
extends 
  Equatable {
}

 class 
 MoviePopularEmpty 

 extends
  MoviePopularState {

  @override List<Object> get props => [];

}

class 
MoviePopularLoading 

extends 
MoviePopularState {

  @override List
    <Object> get props => [];
}

class 
MoviePopularError

 extends 
 MoviePopularState 
{
  final 
    String 
      message;

  @override List<Object> 
      get props => [message];

  MoviePopularError(this.message);
}

class 
  MoviePopularLoaded 

extends 
  MoviePopularState 
{
  final 
    List
     <Movie> 
       result;

  MoviePopularLoaded

  (this.result); @override

      List<Object> 
    get props 
=> [result];

}


abstract class
   MovieRecommendationState 

extends
   Equatable {
}


class 
  MovieRecommendationEmpty 
  
extends 
  MovieRecommendationState
{

  @override
   List<Object> 
      get props => [];

}

class 
  MovieRecommendationLoading 

extends 
  MovieRecommendationState {

  @override
     List<Object>
      get props => [];
}

class

MovieRecommendationError 

extends 

MovieRecommendationState {

  @override List<Object>
    get props 
      => [message];

  final 
   String 
     message;

  MovieRecommendationError
  (this.message);
}

class 
  MovieRecommendationLoaded

  extends 
    MovieRecommendationState {

final
  List

  <Movie>
    movie;

MovieRecommendationLoaded
    (this.movie);

  @override
   List<Object> 
    get props => [movie];
}


abstract class 
  MovieNowPlayingState

extends 
  Equatable {
}

class
 MovieNowPlayingLoading 
 extends 
 MovieNowPlayingState 

{
 @override
  List<Object>
     get props => [];
}

class MovieNowPlayingError 

extends MovieNowPlayingState {

  final 
    String 
      message;

  MovieNowPlayingError(this.message);

 @override List
  <Object> get props => [];
  
}

class 
  MovieNowPlayingEmpty
  extends 
    MovieNowPlayingState 
{
 @override
  List<Object>
     get props => [];
}

class 
  MovieNowPlayingLoaded 

 extends 
      MovieNowPlayingState {

  final 
     List

    <Movie>
        movie;

  MovieNowPlayingLoaded
  
    (this.movie); @override

  List<Object> 
    get props 
      => [movie];
}