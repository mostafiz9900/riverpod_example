import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_riverpod/providers/info_provider.dart';
import 'package:todo_riverpod/ui/about_page.dart';
import 'package:todo_riverpod/ui/change_notify_page.dart';
import 'package:todo_riverpod/ui/future_provider_page.dart';
import 'package:todo_riverpod/ui/home_page.dart';
import 'package:todo_riverpod/ui/photo_page.dart';
import 'package:todo_riverpod/ui/provider_state_page.dart';
import 'package:todo_riverpod/ui/provider_page.dart';
import 'package:todo_riverpod/ui/screen/home_screen.dart';
import 'package:todo_riverpod/ui/state_notify_page.dart';
import 'package:todo_riverpod/ui/streme_provider_page.dart';
import 'package:todo_riverpod/ui/user_page.dart';

// final abcProvider = NotifierProvider<, >(.new);
// final Provider = AsyncNotifierProvider<, >(.new);
final dateFormatterProvider = Provider<DateFormat>((ref) {
  return DateFormat.MMMEd();
});
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, // optional
  ));
  final container = ProviderContainer();
  container.read(aboutControlerProvider);
  container.read(valueProvider);
  container.read(infoProvider('455'));
  // set the publishable key for Stripe - this is mandatory
  runApp(ProviderScope(parent: container, child: const MyApp()));

// runApp(UncontrolledProviderScope(
//   container: container,
//   child: const MyApp(),
// ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(infoProvider('45215'));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blueGrey,
      // ),\
      theme: FlexThemeData.light(
        scheme: FlexScheme.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blumineBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      routerConfig: _router,
      // home: const HomePage(),
    );
  }
}

final GoRouter _router = GoRouter(
  debugLogDiagnostics: true,
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
    GoRoute(
      path: '/providerPage',
      builder: (BuildContext context, GoRouterState state) {
        return const ProviderPage();
      },
    ),
    GoRoute(
      path: '/providerStatePage',
      builder: (BuildContext context, GoRouterState state) {
        return const ProviderStatePage();
      },
    ),
    GoRoute(
      path: '/futureProviderPage',
      builder: (BuildContext context, GoRouterState state) {
        return const FutureProviderPage();
      },
    ),
    GoRoute(
      path: '/stremeProviderPage',
      builder: (BuildContext context, GoRouterState state) {
        return const StremeProviderPage();
      },
    ),
    GoRoute(
      path: '/stateNotifyPage',
      builder: (BuildContext context, GoRouterState state) {
        return const StateNotifyPage();
      },
    ),
    GoRoute(
      path: '/changeNotifyPage',
      builder: (BuildContext context, GoRouterState state) {
        return const ChangeNotifyPage();
      },
    ),
    GoRoute(
      path: '/photo',
      builder: (BuildContext context, GoRouterState state) {
        return const PhotoPage();
      },
    ),
  ],
);
