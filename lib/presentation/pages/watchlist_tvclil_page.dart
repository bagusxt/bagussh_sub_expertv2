import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/watchlist_tvclil_notifier.dart';
import 'package:sub_bagussh/presentation/widget/tvclil_card_list.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/common/utils.dart';

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
    Future.microtask(() =>
        Provider.of<WatchlistTvclilNotifier>
        (context, listen: false)
            .fetchWatchlistTv());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistTvclilNotifier>(context, listen: false)
        .fetchWatchlistTv();
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
        child: Consumer<WatchlistTvclilNotifier>(
          builder: 
          (context, data, child) {
            if 
            (data.watchlistTvState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if 
            (data.watchlistTvState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.watchlistTv[index];
                  return TvclilCard(tv);
                },
                itemCount: data.watchlistTv.length,
              );
            } else {
              return Center(
                key: Key
                ('error_message'),
                child: Text
                (data.message),
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