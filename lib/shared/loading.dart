import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Center(
      child: Image(
        image: AssetImage("assets/cover.png"),
        height: 200,
        fit: BoxFit.contain,
      ),
    )));
  }
}
