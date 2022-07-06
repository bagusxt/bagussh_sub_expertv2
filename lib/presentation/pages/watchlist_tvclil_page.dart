import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/presentation/bloc/tv/watchlist/tv_watchlist_bloc.dart';
import 'package:sub_bagussh/presentation/widget/tvclil_card_list.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/common/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistTvclilPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-tv';

  @override
  _WatchlistTvPageState createState() 
  => _WatchlistTvPageState();
}

class _WatchlistTvPageState extends State<WatchlistTvclilPage>
    with RouteAware {
  @override
 void initState() {
    super.initState();
    Future.microtask(() {
        context.read<TvWatchlistBloc>().add(GetListEvent());
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

   void didPopNext() {
    context.read<TvWatchlistBloc>
    ().add(GetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
        ('Watchlist Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
          builder: (context, state) {
            if (state is TvWatchlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvWatchlistLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TvclilCard(tv);
                },
                itemCount: state.result.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text("Error"),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}