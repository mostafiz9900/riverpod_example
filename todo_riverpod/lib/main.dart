import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_riverpod/ui/about_page.dart';
import 'package:todo_riverpod/ui/home_page.dart';
import 'package:todo_riverpod/ui/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blueGrey,
        // ),\
        theme: FlexThemeData.light(scheme: FlexScheme.amber),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.blumineBlue),
        themeMode: ThemeMode.system,
        routerConfig: _router,
        // home: const HomePage(),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: '/about',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutPage();
      },
    ),
    GoRoute(
      path: '/user',
      builder: (BuildContext context, GoRouterState state) {
        return const UserPage();
      },
    ),
  ],
);
