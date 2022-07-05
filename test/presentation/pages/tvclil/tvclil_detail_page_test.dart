import 'package:sub_bagussh/presentation/provider/tvclil/tvclil_detail_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/presentation/pages/tvclil_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data/dummy_objects_tvclil.dart';
import 'tvclil_detail_page_test.mocks.dart';

@GenerateMocks([TvclilDetailNotifier])
void main() {
  late MockTvclilDetailNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvclilDetailNotifier();
  });

  Widget _makeTestableWidget
  (Widget body) {
    return ChangeNotifierProvider
    <TvclilDetailNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
        (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tv).thenReturn
        (testTvDetail);
        when(mockNotifier.recommendationTvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn
        (<Tvclil>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn(false);

        final watchlistButtonIcon = find.byIcon(Icons.add);

        await tester.pumpWidget(_makeTestableWidget(TvclilDetailPage(id: 1)));

        expect(watchlistButtonIcon, findsOneWidget);
      });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
          (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tv).thenReturn
        (testTvDetail);
        when(mockNotifier.recommendationTvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn
        (<Tvclil>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn
        (true);

        final watchlistButtonIcon = find.byIcon
        (Icons.check);

        await tester.pumpWidget(_makeTestableWidget
        (TvclilDetailPage(id: 1)));

        expect
        (watchlistButtonIcon, findsOneWidget);
      });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
          (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tv).thenReturn
        (testTvDetail);
        when(mockNotifier.recommendationTvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn
        (<Tvclil>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn
        (false);
        when(mockNotifier.watchlistMessageTv).thenReturn
        ('Added to Watchlist');

        final watchlistButton = find.byType
        (ElevatedButton);

        await tester.pumpWidget(_makeTestableWidget
        (TvclilDetailPage(id: 1)));

        expect(find.byIcon(Icons.add), findsOneWidget);

        await tester.tap
        (watchlistButton);
        await tester.pump();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Added to Watchlist'), findsOneWidget);
      });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
        (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tv).thenReturn
        (testTvDetail);
        when(mockNotifier.recommendationTvState).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn
        (<Tvclil>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn
        (false);
        when(mockNotifier.watchlistMessageTv).thenReturn
        ('Failed');

        final watchlistButton = find.byType
        (ElevatedButton);

        await tester.pumpWidget(_makeTestableWidget(TvclilDetailPage(id: 1)));

        expect(find.byIcon(Icons.add), findsOneWidget);

        await tester.tap(watchlistButton);
        await tester.pump();

        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Failed'), findsOneWidget);
      });
}