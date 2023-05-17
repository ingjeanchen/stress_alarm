import 'package:flutter/material.dart';
import 'package:stress_alarm/util/color.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final String title;

  GradientBackground({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            generateMaterialColor(Palette.bg1),
            generateMaterialColor(Palette.bg2)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.0,
              color: Colors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
