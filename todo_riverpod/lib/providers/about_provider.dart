import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/info.dart';
import 'package:todo_riverpod/providers/info_provider.dart';
import 'package:todo_riverpod/ui/about_page.dart';

class AboutProvider {
  final valueProvider = StateProvider.autoDispose<InfoModel?>((ref) {
    return null;
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
  var varLis = ProviderContainer();

  void doSomething() {
    final value = ref.read(dropdownProvider);
    varLis.read(dropdownProvider);
  }
}

final homeController = Provider<HomeController>((ref) {
  return HomeController(ref: ref);
});

class HomeController {
  ProviderRef ref;
  HomeController({required this.ref});
  void toSum() {
    final about = ref.read(aboutProvider);
    final gender = ref.read(about.genderProvider);
    print(gender);
    print('===========================');
  }
}
