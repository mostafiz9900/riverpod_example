import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/providers/about_provider.dart';
import 'package:todo_riverpod/providers/info_provider.dart';

final aboutProvider = Provider.autoDispose<AboutProvider>((ref) {
  return AboutProvider();
});

final dropdownProvider = StateProvider<String>((ref) {
  return '0';
});
final aboutControlerProvider = Provider<AboutController>((ref) {
  return AboutController();
});

class AboutPage extends ConsumerWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutValu = ref.watch(aboutProvider);
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
        title: const Text('AboutPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
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

              onChanged: (newValue) {
                ref.read(aboutValu.valueProvider.notifier).state = newValue!;
                print(newValue);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${value.toString()}'),
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
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ), //SizedBox
                const Text(
                  'Library Implementation Of Searching Algorithm: ',
                  style: TextStyle(fontSize: 17.0),
                ), //Text
                const SizedBox(width: 10), //SizedBox
                /** Checkbox Widget **/
                Checkbox(
                  value: conditionValue,
                  onChanged: (value) {
                    ref.read(aboutValu.conditionProvider.notifier).state =
                        value!;
                  },
                ),
              ], //<Widget>[]
            ),
            const InfoDetails(),
            const SizedBox(
              height: 10,
            ),
            Text('${ref.watch(dropdownProvider)}'),
            const CustomDropdownList(),
          ],
        ),
      ),
    );
  }
}

class InfoDetails extends ConsumerStatefulWidget {
  const InfoDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoDetailsState();
}

class _InfoDetailsState extends ConsumerState<InfoDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(infoProvider('451'));
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(infoProvider('451'));
    // print(counter.value!.length);
    // print('object');
    return counter.value == null
        ? const Text('data')
        : Container(
            child: Text(counter.value!.elementAt(0).email.toString()),
          );
  }
}

class CustomDropdownList extends ConsumerWidget {
  const CustomDropdownList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(dropdownProvider);
    final valueList = ref.watch(infoProvider('25'));
    final aboutCon = ref.watch(aboutControlerProvider);
    ref.listen(
      dropdownProvider,
      (previous, next) {
        print(next);
        print(previous);
      },
    );
    return DropdownButton(
      isExpanded: true,
      // Initial Value
      value: value == '0' ? null : value,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: valueList.value?.map((items) {
        return DropdownMenuItem(
          value: items.email,
          child: Text(items.name!),
        );
      }).toList(),

      onChanged: (newValue) {
        ref.read(dropdownProvider.notifier).state = newValue!;
        ref.read(UiController.pr).someFunction();
        aboutCon.initFun(ref);
        // print(newValue);
      },
    );
  }
}

class AboutController {
  void initFun(WidgetRef ref) {
    final aboutValu = ref.watch(aboutProvider);
    final value = ref.read(dropdownProvider);
    final drop2 = ref.read(aboutValu.valueProvider);
    final drop3 = ref.read(aboutValu.genderProvider);
    print('ekhae ase');
    print(value);
    print(drop2);
    print(drop3);
    print('ekhae ase');
  }
}
