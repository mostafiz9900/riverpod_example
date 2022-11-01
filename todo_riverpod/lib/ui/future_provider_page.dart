import 'package:flutter/material.dart';

class FutureProviderPage extends StatelessWidget {
  const FutureProviderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('FutureProviderPage'),
      ),
      body: Center(
        child: Text('FutureProviderPage'),
      ),
    );
  }
}
