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
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        parent: _heartAnimationController, curve: Curves.bounceOut));
    _heartAnimationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1200));

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
        Expanded(
          child: Container(
            height: _heartAnimation.value + 60,
            width: _heartAnimation.value + 60,
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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: TextButton(
              onPressed: () {
                _heartAnimationController.forward();
              },
              child: const Text('Click Me !'),
            ),
          ),
        )
      ],
    );
  }
}
