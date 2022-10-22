import 'package:flutter_riverpod/flutter_riverpod.dart';

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
