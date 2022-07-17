part of 
'tv_watchlist_bloc.dart';

class RemoveItemTvEvent extends TvWatchlistEvent { final TvclilDetail tvDetail;

  const RemoveItemTvEvent(this.tvDetail); @override List<Object> get props => [tvDetail];

}

class AddItemTvEvent extends TvWatchlistEvent { final TvclilDetail tvDetail;

 @override  List<Object> get props => [tvDetail]; const AddItemTvEvent(this.tvDetail); 

}

abstract class TvWatchlistEvent extends Equatable {

   @override List<Object> get props => []; const TvWatchlistEvent();

}


class GetListEvent extends TvWatchlistEvent { @override List<Object> get props => [];
}

class GetStatusTvEvent extends TvWatchlistEvent {final int id;

  const GetStatusTvEvent(this.id); @override List<Object> get props => [id];

}