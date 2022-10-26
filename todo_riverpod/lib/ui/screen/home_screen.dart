import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final valueProvider = StateProvider<int>((ref) {
  return 28;
});
final selectDropdownProvider = StateProvider<String>((ref) {
  return '0';
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(valueProvider);
    final dropDownValue = ref.watch(selectDropdownProvider);
    ref.listen(valueProvider, ((previous, next) {
      if (next == 40) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Value is 70'),
        ));
        ref.watch(valueProvider.notifier).state = 30;
      }
    }));
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    return Container(
      child: Column(
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
              child: Text('User')),
          DropdownButton(
            isExpanded: true,
            // Initial Value
            value: dropDownValue == '0' ? null : dropDownValue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: Text('Select Item'),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              ref.watch(selectDropdownProvider.state).state = newValue!;
            },
          ),
        ],
      ),
    );
  }
}
