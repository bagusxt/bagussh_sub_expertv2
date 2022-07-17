import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sub_bagussh/presentation/bloc/tv/tv_bloc.dart';
import 'package:sub_bagussh/presentation/widget/tvclil_card_list.dart';

class TopRatedTvclilPage 
  extends StatefulWidget {

static const 
  ROUTE_NAME = '/top-rated-tv';

  @override
  _TopRatedTvPageState createState() => _TopRatedTvPageState();
}

class _TopRatedTvPageState extends State<TopRatedTvclilPage> {
  @override
   void initState() {
    super.initState();
      Future.microtask(() {context.read<TvTopRatedBloc>().add(TvTopRatedGetEvent());
    });
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
        child: BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
          builder: (context, state) {
            if (state is TvTopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvTopRatedLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvs = state.result[index];
                  return TvclilCard(tvs);
                },
                itemCount: state.result.length,
              );
            } else {
              return Center(key: Key('error_message'),  child: Text("Error"),
              );
            }
          },
        ),
      ),
    );
  }
}