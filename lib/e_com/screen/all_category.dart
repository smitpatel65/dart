import 'package:flutter/material.dart';
import 'package:my_app/e_com/function/api_function.dart';

import 'category_productscreen.dart';

class AllCategroy extends StatefulWidget {
  const AllCategroy({super.key});

  @override
  State<AllCategroy> createState() => _AllCategroyState();
}

class _AllCategroyState extends State<AllCategroy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getAllCategory(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){ Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProductScreen(
                          snapshot.data[index],
                        ),
                      ),
                    );},
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          snapshot.data[index].toString().toUpperCase(),
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
