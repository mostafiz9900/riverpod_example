import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../controllers/home_controller.dart';
import '../../providers/clock_provider.dart';

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
    final currentTime = ref.watch(clockProvider);
    final timeFormatted = DateFormat.Hms().format(currentTime);
    var value = ref.watch(valueProvider);
    var homeCon = ref.watch(homeControllerProvider);
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
          Text(timeFormatted),
          ElevatedButton(
              onPressed: () {
                ref.read(valueProvider.notifier).state++;
                homeCon.counter(ref.read(valueProvider));
              },
              child: const Text('Increment')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ref.invalidate(valueProvider);
              },
              child: const Text('invalidate value')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/about');
              },
              child: const Text('Go About Page')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/user');
              },
              child: const Text('User')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/providerPage');
              },
              child: const Text('Provider')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/providerStatePage');
              },
              child: const Text('Provider State')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/futureProviderPage');
              },
              child: const Text('Future Provider State')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/stremeProviderPage');
              },
              child: const Text('Streme Provider State')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/stateNotifyPage');
              },
              child: const Text('State Notify Page')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/changeNotifyPage');
              },
              child: const Text('Change Notify Page')),
          const SizedBox(
            height: 20,
          ),
          dropdownList(dropDownValue, items, ref),
        ],
      ),
    );
  }

  DropdownButton<String> dropdownList(
      String dropDownValue, List<String> items, WidgetRef ref) {
    return DropdownButton(
      isExpanded: true,
      // Initial Value
      value: dropDownValue == '0' ? null : dropDownValue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: const Text('Select Item'),

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
    );
  }
}
