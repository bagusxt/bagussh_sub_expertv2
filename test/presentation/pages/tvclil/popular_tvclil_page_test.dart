import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/popular_tvclil_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/presentation/pages/popular_tvclil_page.dart';

import 'popular_tvclil_page_test.mocks.dart';

@GenerateMocks([PopularTvclilNotifier])
void main() {
  late MockPopularTvclilNotifier mockNotifier;

  setUp(() {
    mockNotifier =
    MockPopularTvclilNotifier();
  });

  Widget _makeTestableWidget
  (Widget body) {
    return ChangeNotifierProvider<PopularTvclilNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn
        (RequestState.Loading);

        final progressBarFinder = find.byType
        (CircularProgressIndicator);
        final centerFinder = find.byType
        (Center);

        await tester.pumpWidget
        (_makeTestableWidget(PopularTvclilPage()));

        expect
        (centerFinder, findsOneWidget);
        expect
        (progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn
        (RequestState.Loaded);
        when(mockNotifier.tv).thenReturn
        (<Tvclil>[]);

        final listViewFinder = find.byType
        (ListView);

        await tester.pumpWidget(_makeTestableWidget
        (PopularTvclilPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn
        (RequestState.Error);
        when(mockNotifier.message).thenReturn
        ('Error message');

        final textFinder = find.byKey
        (Key('error_message'));

        await tester.pumpWidget
        (_makeTestableWidget(PopularTvclilPage()));

        expect(textFinder, findsOneWidget);
      });
}