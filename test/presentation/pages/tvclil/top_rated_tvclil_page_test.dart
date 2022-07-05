import 'package:sub_bagussh/common/state_enum.dart';
import 'package:sub_bagussh/domain/entities/tvclil/tvclil.dart';
import 'package:sub_bagussh/presentation/pages/top_rated_tvclil_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:sub_bagussh/presentation/provider/tvclil/top_rated_tvclil_notifier.dart';
import 'package:mockito/annotations.dart';

import 'top_rated_tvclil_page_test.mocks.dart';

@GenerateMocks([TopRatedTvclilNotifier])
void main() {
  late MockTopRatedTvclilNotifier mockNotifier;

  setUp(() {
    mockNotifier = 
    MockTopRatedTvclilNotifier();
  });

  Widget _makeTestableWidget
  (Widget body) {
    return ChangeNotifierProvider
    <TopRatedTvclilNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn
        (RequestState.Loading);

        final progressFinder = find.byType
        (CircularProgressIndicator);
        final centerFinder = find.byType
        (Center);

        await tester.pumpWidget(_makeTestableWidget
        (TopRatedTvclilPage()));

        expect
        (centerFinder, findsOneWidget);
        expect
        (progressFinder, findsOneWidget);
      });

  testWidgets('Page should display when data is loaded',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.Loaded);
        when(mockNotifier.tv).thenReturn(<Tvclil>[]);

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget
        (TopRatedTvclilPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.Error);
        when(mockNotifier.message).thenReturn('Error message');

        final textFinder = find.byKey(Key('error_message'));

        await tester.pumpWidget(_makeTestableWidget(TopRatedTvclilPage()));

        expect(textFinder, findsOneWidget);
      });
}