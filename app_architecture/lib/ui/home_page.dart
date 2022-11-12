import 'package:app_architecture/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';
import '../core/load_dilog.dart';

final GlobalKey<State> _keyLoader = GlobalKey<State>();

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static String get routeName => 'home';
  static String get routeLocation => '/';
  onAdd(WidgetRef ref) {
    ref.read(homeControllerProvider).addEntry(DateTime.now().toString());
  }

  onRemove(WidgetRef ref, String entry) {
    ref.read(homeControllerProvider).removeEntry(entry);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home Page"),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              child: const Text("Logout"),
            ),
            Expanded(
              child: ref.watch(entriesProvider).when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, trace) =>
                        Center(child: Text(error.toString())),
                    data: (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return ListTile(title: Text(item));
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // onAdd(ref);
          try {
            // Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
            // Future.delayed(
            //   Duration(seconds: 2),
            //   () {
            //     Navigator.of(_keyLoader.currentContext!, rootNavigator: true)
            //         .pop();
            //   },
            // );
            //close the dialoge
            showLoaderDialog(context);
            await Future.delayed(
              const Duration(seconds: 3),
              () {
                Navigator.pop(context);
              },
            );
            // Navigator.pushReplacementNamed(context, "/home");
            onAdd(ref);
          } catch (error) {
            print(error);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
