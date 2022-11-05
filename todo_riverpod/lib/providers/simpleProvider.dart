import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleProvider = Provider<SimpleProvider>(
  (ref) => SimpleProvider(),
);

class SimpleProvider {
  String name = 'Mostafiz';
  int age = 29;
  String email = 'mostafiz9900';
}
