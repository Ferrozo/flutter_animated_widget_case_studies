import 'package:flutter/material.dart';
import 'package:light_and_dark_mode_animated/src/presentation/screens/home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
