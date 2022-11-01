import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>(
  (ref) => 'Mostafizur',
);

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderPage'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final name = ref.read(nameProvider);
        return Column(
          children: [
            Center(
              child: Text(name),
            ),
          ],
        );
      }),
    );
  }
}
