import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sub_bagussh/presentation/provider/tvclil/tvclil_search_notifier.dart';
import 'package:sub_bagussh/presentation/widget/tvclil_card_list.dart';
import 'package:sub_bagussh/common/constants.dart';
import 'package:sub_bagussh/common/state_enum.dart';

class SearchTvclilPage extends StatelessWidget {
  static const ROUTE_NAME = '/search-tv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<TvclilSearchNotifier>(context, listen: false)
                    .fetchTvSearch(query);
              },
              decoration: InputDecoration(
                hintText: 
                'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer<TvclilSearchNotifier>(
              builder: (context, data, child) {
                if 
                (data.state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if
                 (data.state == RequestState.Loaded) {
                  final result = data.searchTvResult;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: 
                      (context, index) {
                        final tv = data.searchTvResult[index];
                        return TvclilCard(tv);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}