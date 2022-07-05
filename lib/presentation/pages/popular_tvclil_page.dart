import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/popular_tvclil_notifier.dart';
import 'package:sub_bagussh/presentation/widget/tvclil_card_list.dart';

class PopularTvclilPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv';

  @override
  _PopularTvPageState createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvclilPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<PopularTvclilNotifier>(context, listen: false)
            .fetchPopularTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
        ('Popular Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PopularTvclilNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
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
                child: 
                Text
                (data.message),
              );
            }
          },
        ),
      ),
    );
  }
}