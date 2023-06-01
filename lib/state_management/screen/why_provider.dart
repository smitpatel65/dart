// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int count = 0;
  @override
  void initState() { 
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      print(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Provider',
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(count.toString(), style: const TextStyle(fontSize: 40)),
          )
        ],
      ),
    );
  }
}
