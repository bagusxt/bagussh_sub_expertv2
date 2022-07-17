import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/search_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_detail.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_popluar_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_top_rated_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_now_playing_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_tvclil_recomendations.dart';

import 'dart:async';
import 'package:bloc/bloc.dart';

part 'tv_event.dart';

part 'tv_state.dart';

//tv_dtl

class 
  TvDetailBloc

 extends 
  Bloc<TvDetailEvent,
     TvDetailState> {

  final 
    GetTvclilDetail 
      getTvDetail;

  TvDetailBloc(

  {required this.getTvDetail, }) : super(TvDetailEmpty()) {on<GetTvDetailEvent>(_loadTvDetail); }

    FutureOr<void> _loadTvDetail(GetTvDetailEvent event,Emitter<TvDetailState> emit)
  
  async {emit(TvDetailLoading());
    final result = await getTvDetail.execute(event.id);

      result.fold( (failure) { emit(TvDetailError(failure.message));},
        (data) { emit(TvDetailLoaded(data));
        },
      );
    }
  }

//src
class 
  TvSearchBloc 
  
extends 
  Bloc

   <TvSearchEvent, 
    TvSearchState> {

  final 
    SearchTvclil 
      searchTv;

  TvSearchBloc(

   {required this.searchTv,}) : super(TvSearchEmpty()) {on<TvSearchSetEmpty>((event, emit) => emit(TvSearchEmpty()));

    on<TvSearchQueryEvent>((event, emit) async {emit(TvSearchLoading());
      final result = await searchTv.execute(event.query);
        result.fold((failure) { emit(TvSearchError(failure.message));},
           (data) {  emit(TvSearchLoaded(data));
        },
      );
    });
  }
}

//top
class
   TvTopRatedBloc 

  extends 
    Bloc
      <TvTopRatedEvent, 
        TvTopRatedState> {

   final
     GetTopRatedTvclil 
      getTopRatedTv;

  TvTopRatedBloc
    (this.getTopRatedTv,) 

  : super
    (TvTopRatedEmpty()) {

    on
      <TvTopRatedGetEvent>
        (_loadTopRatedTv);
  }

  FutureOr
    <void> 
      _loadTopRatedTv(

        TvTopRatedGetEvent
           event,
              Emitter

        <TvTopRatedState>
            emit,
) 

async {
      emit
        (TvTopRatedLoading());

      final result
         = await 
          getTopRatedTv.execute();

      result.fold(
        (failure) {
          emit

            (TvTopRatedError
              (failure.message));
        },


        (data) {emit(TvTopRatedLoaded (data));
      },
    );
  }
}


//popluar
class 
  TvPopularBloc 

extends 
  Bloc<TvPopularEvent, 
    TvPopularState> {

  final 
    GetPopularTvclil 
      getPopularTv;

  TvPopularBloc(

    this.getPopularTv,) : 
      super(TvPopularEmpty()) {

         on<TvPopularGetEvent>
            ((event, emit) async {

      emit(TvPopularLoading());
      
      final result 
        = await 
          getPopularTv.execute();

      result.fold(
        (failure) {

           emit(TvPopularError
              (failure.message));},

        (data) {
          emit
            (TvPopularLoaded(data));
        },
      );
    });
  }
}

//recom
class 
  TvRecommendationBloc

  extends 
    Bloc
      <TvRecommendationEvent,

         TvRecommendationState> {


  final 
    GetTvclilRecommendations 

      getTvRecommendations;

  TvRecommendationBloc({
    required 
      this.getTvRecommendations,
  }
): 

super
(TvRecommendationEmpty()) {
    on<GetTvRecommendationEvent>
      ((event, emit) 
      
      async {
       emit
        (TvRecommendationLoading());
    
      final result
         = await 
            getTvRecommendations
                  .execute(event.id);


      result.fold(
        (failure) {
          emit(TvRecommendationError
                  (failure.message));
                  
        },
        (data) {
          emit
              (TvRecommendationLoaded
                  (data));
          },
       );
    });
  }
}

//airing
class 
  TvOnAirBloc
  
extends 
  Bloc
    <TvOnAirEvent, 
      TvOnAirState> 
      
{
  final 
    GetNowPlayingTvclil
       getOnAirTv;

  TvOnAirBloc(
    this.getOnAirTv,

  ) : super
      (TvOnAirEmpty()) {

         on<TvOnAirGetEvent>
            ((event, emit) async {

      emit(TvOnAirLoading());

   final 
     result 
       = await 
        getOnAirTv.execute();

   result.fold(
     (failure) {
          emit
            (TvOnAirError
              (failure.message));

      },
        (data) {
          emit
            (TvOnAirLoaded
              (data));
           },
          );
       }
     );
 }
}