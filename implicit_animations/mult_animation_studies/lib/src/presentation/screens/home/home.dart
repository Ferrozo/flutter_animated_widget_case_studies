import 'package:flutter/material.dart';
import 'package:mult_animation_studies/src/presentation/screens/export_screens.dart';
import 'package:mult_animation_studies/src/presentation/widgets/export_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AngleAnimation(),
            const HeartBeat(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AnimatedPage()),
                  );
                },
                child: const Text('Go to animation?'))
          ],
        ),
      ),
    );
  }
}
