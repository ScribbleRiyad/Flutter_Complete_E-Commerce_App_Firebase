import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribble_commerce/const/app_colors.dart';
import 'package:scribble_commerce/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 8),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => const LogInScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorCode,
      body: Center(
        child: SizedBox(
            height: 250.00.h,
            child: Image.asset('assets/images/scribble-logo-animation.gif')),
      ),
    );
  }
}
