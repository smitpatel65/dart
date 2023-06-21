import 'dart:async';

import 'package:flutter/material.dart';

class StreamHomeScreen extends StatelessWidget {
  const StreamHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StreamController counterStream = StreamController.broadcast();
    int counter = 0;
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Home Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: StreamBuilder(
                stream: counterStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'error',
                    );
                  }
                }),
          ),
          Center(
            child: StreamBuilder(
                stream: counterStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'error',
                    );
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterStream.sink.add(counter++);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
