// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class StateHomeScreen extends StatefulWidget {
  const StateHomeScreen({super.key});

  @override
  State<StateHomeScreen> createState() => _StateHomeScreenState();
}

class _StateHomeScreenState extends State<StateHomeScreen> {
  int count = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Center(
                child: Text(count.toString(),
                    style: const TextStyle(fontSize: 40))),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            print(count);
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
