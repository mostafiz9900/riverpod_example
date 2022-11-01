import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeNotifyPage extends StatelessWidget {
  const ChangeNotifyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('ChangeNotifyPage'),
        leading: InkWell(
          onTap: () {
            // Navigator.of(context, rootNavigator: true).pop(context);
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Center(
        child: Text('ChangeNotifyPage'),
      ),
    );
  }
}
