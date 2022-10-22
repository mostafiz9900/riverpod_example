import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final valueProvider = StateProvider<int>((ref) {
  return 28;
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(valueProvider);
    ref.listen(valueProvider, ((previous, next) {
      if (next == 40) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Value is 70'),
        ));
        ref.watch(valueProvider.notifier).state = 30;
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(value.toString()),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(valueProvider.notifier).state++;
              },
              child: Text('Increment')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ref.invalidate(valueProvider);
              },
              child: Text('invalidate value')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/about');
              },
              child: Text('Go About Page')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/user');
              },
              child: Text('User'))
        ],
      ),
    );
  }
}
