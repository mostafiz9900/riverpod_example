import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/info.dart';
import 'package:todo_riverpod/providers/info_provider.dart';
import 'package:todo_riverpod/ui/about_page.dart';

class AboutProvider {
  final valueProvider = StateProvider.autoDispose<String>((ref) {
    return 'Item 1';
  });
  final genderProvider = StateProvider<String>((ref) {
    return 'mail';
  });
  final conditionProvider = StateProvider<bool>((ref) {
    return false;
  });
}

class UiController {
  UiController(this._ref);

  final Ref _ref;

  get _reader => _ref.read;

  static final pr = Provider<UiController>((ref) => UiController(ref));

  void someFunction() {
    var data = _reader(dropdownProvider);
    print(data);
    print('=====');
  }
}

final provider = StateNotifierProvider((ref) {
  return MyStateNotifier(InfoModel(), ref);
});

class MyStateNotifier extends StateNotifier<InfoModel> {
  final Ref ref;

  MyStateNotifier(super.state, this.ref);

  void doSomething() {
    final value = ref.read(dropdownProvider);
  }
}
