import 'package:flutter/material.dart';

class NotifyListenerscreen extends StatefulWidget {
  const NotifyListenerscreen({super.key});

  @override
  State<NotifyListenerscreen> createState() => _NotifyListenerscreenState();
}

class _NotifyListenerscreenState extends State<NotifyListenerscreen> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  ValueNotifier<bool> toogle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    debugPrint('bild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifyListener'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toogle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toogle.value,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffix: InkWell(
                      onTap: () {
                        toogle.value = !toogle.value;
                      },
                      child: Icon(toogle.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                );
              }),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          debugPrint(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
