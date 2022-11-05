import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomStateProvider = StateNotifierProvider(
  (ref) => RandomNumGenerator(),
);

class RandomNumGenerator extends StateNotifier<int> {
  RandomNumGenerator() : super(Random().nextInt(9999));
  void generate() {
    state = Random().nextInt(9999);
  }
}
