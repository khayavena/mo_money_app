// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mo_money_app/features/login/repository/login_repository.dart';
import 'package:mo_money_app/features/main/auth_route_gaurd.dart';
import 'package:mo_money_app/features/main/main_app.dart';
import 'package:mo_money_app/features/main/router.gr.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  MockLoginRepository mockLoginRepository = MockLoginRepository();
  AppRouter appRouter = AppRouter(
      authenticatedRouteGuard: AuthenticatedRouteGuard(mockLoginRepository));

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {});
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    when(mockLoginRepository.isLoggedIn()).thenAnswer((_) async => true);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MainApp(router: appRouter));

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byKey(const Key("homePage")));
    await tester.tap(find.byKey(const Key("cardBalanceWidget")));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
