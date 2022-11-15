import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ui/screen/home_screen.dart';

final homeControllerProvider = Provider<HomeController>((ref) {
  return HomeController(ref: ref);
});

class HomeController {
  HomeController({required this.ref}) {
    _init();
  }
  Ref ref;
  void _init() {
    print('call home controller');
    value = ref.read(valueProvider);
    print(value);
  }

  int? value;

  void counter(int valu) {
    print('param value = $valu');
    value = ref.read(valueProvider);
    print(value);
    print('-------');
  }
}
