import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/providers/about_provider.dart';

final aboutProvider = Provider<AboutProvider>((ref) {
  return AboutProvider();
});

class AboutPage extends ConsumerWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutValu = ref.read(aboutProvider);
    final value = ref.watch(aboutValu.valueProvider);
    final genderValue = ref.watch(aboutValu.genderProvider);
    final conditionValue = ref.watch(aboutValu.conditionProvider);
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutPage'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('AboutPage'),
          ),
          DropdownButton(
            isExpanded: true,
            // Initial Value
            value: value,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (newValue) {
              ref.read(aboutValu.valueProvider.notifier).state = newValue!;
              print(newValue);
              // setState(() {
              //   dropdownvalue = newValue!;
              // });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text('Mail'),
            leading: Radio(
              value: "mail",
              groupValue: genderValue,
              onChanged: (value) {
                ref.watch(aboutValu.genderProvider.notifier).state = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('Femail'),
            leading: Radio(
              value: 'femail',
              groupValue: genderValue,
              onChanged: (value) {
                ref.watch(aboutValu.genderProvider.notifier).state = value!;
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ), //SizedBox
              Text(
                'Library Implementation Of Searching Algorithm: ',
                style: TextStyle(fontSize: 17.0),
              ), //Text
              SizedBox(width: 10), //SizedBox
              /** Checkbox Widget **/
              Checkbox(
                value: conditionValue,
                onChanged: (value) {
                  ref.read(aboutValu.conditionProvider.notifier).state = value!;
                },
              ), //Checkbox
            ], //<Widget>[]
          ),
        ],
      ),
    );
  }
}
