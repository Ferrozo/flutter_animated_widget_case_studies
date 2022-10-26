import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 100.0;
  double _width = 100.0;
  Color _containerColor = Colors.red;
  BorderRadiusGeometry _containerBorderRadius = BorderRadius.circular(20);

  final randomValue = Random();

  void _randomShape() {
    setState(() {
      _width = randomValue.nextInt(150).toDouble();
      _height = randomValue.nextInt(150).toDouble();
      _containerColor = Color.fromRGBO(
        randomValue.nextInt(780),
        randomValue.nextInt(780),
        randomValue.nextInt(780),
        1,
      );
      _containerBorderRadius =
          BorderRadius.circular(randomValue.nextInt(50).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // height: _height,
      // width: _width,
      color: _containerColor,

      duration: const Duration(seconds: 5),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimatedContainer(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: _containerBorderRadius,
              color: Colors.black,
            ),
            duration: const Duration(seconds: 5),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: _containerColor,
          onPressed: () => _randomShape(),
          child: const Icon(Icons.dynamic_feed),
        ),
      ),
    );
  }
}
