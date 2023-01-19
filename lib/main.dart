import 'package:breeze_case/core/app/app.locator.dart';
import 'package:breeze_case/core/app/app.router.dart';
import 'package:breeze_case/core/constants/enums.dart';
import 'package:breeze_case/ui/views/home_view.dart';
import 'package:breeze_case/ui/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // This should be first line in main
  setupLocator(environment: Environment.dev.name);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        theme: BreezeTheme.themeData,
        home: const HomeView());
  }
}
