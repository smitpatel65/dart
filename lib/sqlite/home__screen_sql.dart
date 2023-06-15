// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/sqlite/db_handler.dart';
import 'package:my_app/sqlite/notes.dart';

class HomeScreenSql extends StatefulWidget {
  const HomeScreenSql({super.key});

  @override
  State<HomeScreenSql> createState() => _HomeScreenSqlState();
}

class _HomeScreenSqlState extends State<HomeScreenSql> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> noteslist;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    noteslist = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nots Sql'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: noteslist,
              builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                     return Card(
                    child: ListTile(
                      contentPadding:   const EdgeInsets.all(0),
                      title: Text(snapshot.data![index].title.toString()),
                      subtitle: Text(snapshot.data![index].age.toString()),
                      trailing: Text(snapshot.data![index].description.toString()),
                    ),
                  );
                  },
                 
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(NotesModel(
            id: 1,
            title: 'First Nots',
            age: 20,
            description: 'this is my feast sql app',
            email: 'abc@gmail.com',
          ))
              .then((value) {
            debugPrint('Data add');
          }).onError((error, stackTrace) {
            debugPrint(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
