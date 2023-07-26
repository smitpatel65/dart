import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double height = 100;
  double width = 100;
  Color color = Colors.green;
  BorderRadiusGeometry radiusGeometry = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Center(
        child: AnimatedContainer(
          height: height,
          width: width,
          decoration: BoxDecoration(color: color, borderRadius: radiusGeometry),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final random = Random();
          height = random.nextInt(300).toDouble();
          width = random.nextInt(300).toDouble();
          color = Color.fromRGBO(
              random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
          radiusGeometry =
              BorderRadius.circular(random.nextInt(100).toDouble());
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
