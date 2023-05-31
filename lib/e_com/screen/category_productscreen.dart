import 'package:flutter/material.dart';
import 'package:my_app/e_com/screen/product_detail.dart';

import '../function/api_function.dart';

class CategoryProductScreen extends StatelessWidget {
  final String categoryName;
   const CategoryProductScreen(this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: ApiService().getProductByCategory(categoryName),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['title']),
                  leading: Image.network(
                    snapshot.data[index]['image'],
                    height: 50,
                    width: 30,
                  ),
                  subtitle: Text("price - \$${snapshot.data[index]['price']}"),
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
