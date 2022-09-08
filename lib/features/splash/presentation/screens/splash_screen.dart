import 'dart:async';

import 'package:elwatn/features/navigation_bar/presentation/screens/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const NavigatorBar()));

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageAssets.watanLogo,
            ),
          ),
        ],
      ),
    );
  }
}
