import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mult_animation_studies/src/presentation/screens/export_screens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const App());
}
