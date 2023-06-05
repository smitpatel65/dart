import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotifyListenerscreen extends StatelessWidget {
  NotifyListenerscreen({super.key});
  // ignore: prefer_final_fields
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('bild');
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
                              : Icons.visibility))),
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
            // ignore: avoid_print
            print(_counter.value.toString());
          },
          child: const Icon(Icons.add)),
    );
  }
}
