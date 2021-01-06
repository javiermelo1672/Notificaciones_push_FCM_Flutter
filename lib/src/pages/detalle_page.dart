import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Push app'),
      ),
      body: Center(
        child: Container(
          child: Text(arg),
        ),
      ),
    );
  }
}
