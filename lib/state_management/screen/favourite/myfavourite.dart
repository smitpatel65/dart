import 'package:flutter/material.dart';
import 'package:my_app/state_management/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    // ignore: avoid_print
    print('bild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fevourite App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavouriteScreen()));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteItemProvider.selectItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.selectItem.contains(index)) {
                        value.removItem(index);
                      } else {
                        value.addItem(index);
                      }
                    },
                    title: Text('Item $index'),
                    trailing: Icon(value.selectItem.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }

}