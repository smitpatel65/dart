import 'package:flutter/material.dart';
import 'package:my_app/e_com/screen/product_detail.dart';

import '../function/api_function.dart';
import 'all_category.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllCategroy()),
              );
            },
            icon: const Icon(Icons.view_list),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
              
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),

      body: FutureBuilder(
        future: ApiService().getAllPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle:
                        Text("price - \$${snapshot.data[index]['price']}"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(snapshot.data[index]['id']),
                          ));
                    },
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await ApiServices().updateCart(1, id);
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text("Product added to cart")),
      //     );
      //   },
      //   backgroundColor: Colors.cyan,
      //   child: const Icon(Icons.add_shopping_cart_outlined),
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
