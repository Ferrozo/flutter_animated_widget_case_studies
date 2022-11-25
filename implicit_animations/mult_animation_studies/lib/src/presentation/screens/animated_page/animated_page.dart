import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({Key? key}) : super(key: key);

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with TickerProviderStateMixin {
  late Animation _containerSizeAnimation,
      _containerRadiusAnimation,
      _containerColorAnimation;
  late AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100), end: BorderRadius.circular(0))
        .animate(
      CurvedAnimation(
          parent: _containerAnimationController, curve: Curves.ease),
    );

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
          curve: Curves.ease, parent: _containerAnimationController),
    );

    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.orange).animate(
      CurvedAnimation(
          curve: Curves.ease, parent: _containerAnimationController),
    );
    _containerAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: _containerAnimationController,
        builder: (context, child) {
          return Container(
            transform: Matrix4.translationValues(0, 0, 0),
            width: _containerSizeAnimation.value * height,
            height: _containerSizeAnimation.value * height,
            decoration: BoxDecoration(
              borderRadius: _containerRadiusAnimation.value,
              color: _containerColorAnimation.value,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: const Center(
                child: Text(
                  'Wow Am here working',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
