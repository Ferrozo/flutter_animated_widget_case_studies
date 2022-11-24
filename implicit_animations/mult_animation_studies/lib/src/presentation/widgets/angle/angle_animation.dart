import 'dart:math';

import 'package:flutter/material.dart';

class AngleAnimation extends StatefulWidget {
  const AngleAnimation({Key? key}) : super(key: key);

  @override
  State<AngleAnimation> createState() => _AngleAnimationState();
}

class _AngleAnimationState extends State<AngleAnimation>
    with TickerProviderStateMixin {
  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 300));
    _arrowAnimation = Tween(
      begin: 0.0,
      end: pi,
    ).animate(_arrowAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          child: AnimatedBuilder(
            animation: _arrowAnimationController,
            builder: (context, child) => Transform.rotate(
                angle: _arrowAnimation.value,
                child: const Icon(
                  Icons.expand_less,
                  color: Colors.white,
                )),
          ),
        ),
        TextButton(
            onPressed: () {
              _arrowAnimationController.isCompleted
                  ? _arrowAnimationController.reverse()
                  : _arrowAnimationController.forward();
            },
            child: const Text('Click Me !'))
      ],
    );
  }
}
