import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/top_rated_tvclil_notifier.dart';
import 'package:sub_bagussh/presentation/widget/tvclil_card_list.dart';
import 'package:sub_bagussh/common/state_enum.dart';

class TopRatedTvclilPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv';

  @override
  _TopRatedTvPageState createState() => _TopRatedTvPageState();
}

class _TopRatedTvPageState extends State<TopRatedTvclilPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TopRatedTvclilNotifier>(context, listen: false)
            .fetchTopRatedTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
        ('Top Rated Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TopRatedTvclilNotifier>(
          builder: 
          (context, data, child) {
            if 
            (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if 
            (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvs = data.tv[index];
                  return TvclilCard(tvs);
                },
                itemCount: data.tv.length,
              );
            } else {
              return Center(
                key: Key
                ('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}