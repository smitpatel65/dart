import 'package:flutter/material.dart';
import 'package:my_app/provider/favourite_provider.dart';
import 'package:my_app/state_management/screen/favourite/myfavourite.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> selectItem = [];

  @override
  Widget build(BuildContext context) {
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
              itemCount: 100,
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
