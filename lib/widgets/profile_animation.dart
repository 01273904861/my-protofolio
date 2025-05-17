import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';

import '../globals/app_assets.dart';

class ProfileAnimation extends StatefulWidget {
  const ProfileAnimation({Key? key}) : super(key: key);

  @override
  _ProfileAnimationState createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    _animation = Tween(begin: const Offset(0,0.05), end: const Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
            clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 4.0,
              blurRadius: 4.5,
              offset: Offset(10, 10),
            )
          ],
          border: Border.all(color: AppColors.themeColor, width: 2.0),
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          AppAssets.profile3,
          width: 450,
          height: 450,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}


    