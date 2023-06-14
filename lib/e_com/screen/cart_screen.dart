import 'package:flutter/material.dart';
import 'package:my_app/e_com/function/api_function.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: ((context, index) {
                return FutureBuilder(
                  future: ApiService()
                      .getSingleProduct(products[index]['productId']),
                  builder: (context, AsyncSnapshot asyncSnapshot) {
                    if (asyncSnapshot.hasData) {
                      return ListTile(
                        title: Text(asyncSnapshot.data["title"]),
                        leading: Image.network(
                          asyncSnapshot.data['image'],
                          height: 40,
                        ),
                        subtitle: Text(
                          "Quantity - ${products[index]['quantity']}",
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            await ApiService().deleteCart('1');

                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Item Deleted Successfully..."),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    return const LinearProgressIndicator();
                  },
                );
              }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.green,
        child: const Center(
          child: Text(
            "Order Now",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
