import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil_detail.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/save_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/remove_watchlist_tvclil.dart';
import 'package:sub_bagussh/domain/usecases/tvclil/get_watchlist_status_tvclil.dart';

part 'tv_watchlist_event.dart';


part 'tv_watchlist_state.dart';

class TvWatchlistBloc 
  extends Bloc

    <TvWatchlistEvent, 
      TvWatchlistState>
{
  static 
    const 
      watchlistAddSuccessMessage 
       = 'Succes Added to your Watchlist';


  static 
    const 
      watchlistRemoveSuccessMessage 
       = 'Succes Removed from your Watchlist';

  final 
       RemoveWatchlistTvclil 
       
    removeWatchlist;

  final
       GetWatchlistTvclil

    getWatchlistTv;

  final 
       SaveWatchlistTvclil 

    saveWatchlist;

  final 
      GetWatchListStatusTvclil 

  getWatchListStatus;

  TvWatchlistBloc(

{
    required 
      this
        .getWatchlistTv,


    required 
      this
        .getWatchListStatus,
        

    required 
      this.saveWatchlist,


    required 
      this.removeWatchlist,
}
): 

  super(TvWatchlistEmpty()) { on<GetListEvent>((event, emit) async { emit(TvWatchlistLoading());
    final result = await getWatchlistTv.execute();

      result.fold( (failure) { emit(TvWatchlistError(failure.message)); },
        (data) { data.isEmpty ? emit(TvWatchlistEmpty())  : emit(TvWatchlistLoaded(data));
      },
    );
  }
);

  on<GetStatusTvEvent>((event, emit) async {final id = event.id;
      final result = await getWatchListStatus.execute(id);
          emit(TvWatchlistStatusLoaded(result));
  }
);


  on<AddItemTvEvent>
      ((event, emit) 

async{

  final tvDetail
     = event.tvDetail;
       final result 

        = await saveWatchlist
              .execute(tvDetail);

      result.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (successMessage) {
          emit(TvWatchlistSuccess(successMessage));
      },
    );
  }
);

  on<RemoveItemTvEvent>((event, emit) async {final tvDetail = event.tvDetail;
  
      final result
         = await removeWatchlist.execute(tvDetail);

      result.fold( (failure) { emit(TvWatchlistError(failure.message)); },

        (successMessage) {emit(TvWatchlistSuccess(successMessage));
          },
       );
     }
    );
  }
}