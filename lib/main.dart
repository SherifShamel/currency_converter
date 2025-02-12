import 'package:currency_converter/core/config/routes/page_route_names.dart';
import 'package:currency_converter/core/config/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: PageRouteNames.initial,
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.onGenerate,
    );
  }
}
