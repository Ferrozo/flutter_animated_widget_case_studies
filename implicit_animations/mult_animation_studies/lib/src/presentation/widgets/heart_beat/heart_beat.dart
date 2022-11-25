import 'package:flutter/material.dart';

class HeartBeat extends StatefulWidget {
  const HeartBeat({Key? key}) : super(key: key);

  @override
  State<HeartBeat> createState() => _HeartBeatState();
}

class _HeartBeatState extends State<HeartBeat> with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();

    _heartAnimationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1200));

    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        parent: _heartAnimationController, curve: Curves.bounceOut));
    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _heartAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: SizedBox(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _heartAnimationController.forward();
              },
              child: const Text('Start ?'),
            ),
            TextButton(
              onPressed: () {
                _heartAnimationController.stop();
              },
              child: const Text('Stop !'),
            ),
          ],
        ),
      ],
    );
  }
}
