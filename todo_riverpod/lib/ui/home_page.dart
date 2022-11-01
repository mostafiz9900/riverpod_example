import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/ui/screen/home_screen.dart';

final navProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navValue = ref.watch(navProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: IndexedStack(
        index: navValue,
        children: const [HomeScreen(), Text('Services'), Text('Profile')],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Payment',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: navValue,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: (value) => ref.watch(navProvider.state).state = value,
          elevation: 5),
    );
  }
}
