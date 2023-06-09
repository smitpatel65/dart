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
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            debugPrint(count.toString());
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
