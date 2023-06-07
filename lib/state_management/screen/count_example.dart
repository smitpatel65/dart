import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExampke extends StatefulWidget {
  const CountExampke({super.key});

  @override
  State<CountExampke> createState() => _CountExampkeState();
}

class _CountExampkeState extends State<CountExampke> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 0), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // ignore: avoid_print
    print('bild');
    return Scaffold(
      appBar: AppBar(
        title: const Text("CountExample"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              return Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 40),
              );
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: const Icon(Icons.add)),
    );
  }
}
