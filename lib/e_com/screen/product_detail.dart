import 'package:flutter/material.dart';
import 'package:my_app/e_com/function/api_function.dart';

class ProductDetail extends StatefulWidget {
  final int id;
  // ignore: use_key_in_widget_constructors
  const ProductDetail(this.id);
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ApiService().getSingleProduct(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.network(
                        snapshot.data['image'],
                        height: 200,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text('\$${snapshot.data['price']}',
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data['title'],
                        style: const TextStyle(fontSize: 25),
                      ),
                      Chip(
                        label: Text(
                          snapshot.data['category'].toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(snapshot.data['description'])
                    ]),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item Add Successfully..."),
            backgroundColor: Colors.red,
          ));
        },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
