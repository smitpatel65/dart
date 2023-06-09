import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/Models/nots_models.dart';

import '../boxes/boxes.dart';

class HomeScreenHive extends StatefulWidget {
  const HomeScreenHive({super.key});

  @override
  State<HomeScreenHive> createState() => _HomeScreenHiveState();
}

class _HomeScreenHiveState extends State<HomeScreenHive> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive database'),
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.gatdata().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(data[index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                _editDialog(
                                  data[index],
                                  data[index].title.toString(),
                                  data[index].description.toString(),
                                );
                              },
                              child: const Icon(Icons.edit)),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                delete(data[index]);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Item Deleted Successfully..."),
                                  backgroundColor: Colors.black,
                                ));
                              },
                              child: const Icon(Icons.delete)),
                        ],
                      ),
                      Text(data[index].description.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }

  Future<void> _editDialog(
      NotesModel notesModel, String title, String description) async {
    titleController.text = title;
    descriptionController.text = description;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit NOTES'),
          content: SingleChildScrollView(
              child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: 'Enter Title', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder()),
              )
            ],
          )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancle')),
            TextButton(
                onPressed: () async {
                  notesModel.title = titleController.text.toString();
                  notesModel.description =
                      descriptionController.text.toString();
                  notesModel.save();
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Item Edit Successfully..."),
                    backgroundColor: Colors.black,
                  ));
                },
                child: const Text('Edit')),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add NOTES'),
          content: SingleChildScrollView(
              child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: 'Enter Title', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder()),
              )
            ],
          )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancle')),
            TextButton(
                onPressed: () {
                  final data = NotesModel(
                      title: titleController.text,
                      description: descriptionController.text);
                  final box = Boxes.gatdata();
                  box.add(data);
                  data.save();
                  //print(box);
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(" Creat Successfully..."),
                    backgroundColor: Colors.black,
                  ));
                },
                child: const Text('Add')),
          ],
        );
      },
    );
  }
}
