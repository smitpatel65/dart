// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'db_handler.dart';
import 'notes.dart';

class HomeScreenSql extends StatefulWidget {
  const HomeScreenSql({Key? key}) : super(key: key);

  @override
  State<HomeScreenSql> createState() => _HomeScreenSqlState();
}

class _HomeScreenSqlState extends State<HomeScreenSql> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    notesList = dbHelper!.getNotesList();
  }

  Future<void> _showEditDialog(BuildContext context, NotesModel? note) async {
    final TextEditingController idController = TextEditingController(
        text: note != null ? note.id.toString() : '');
    final TextEditingController titleController =
        TextEditingController(text: note != null ? note.title : '');
    final TextEditingController ageController = TextEditingController(
        text: note != null ? note.age.toString() : '');
    final TextEditingController descriptionController =
        TextEditingController(
            text: note != null ? note.description : '');
    final TextEditingController emailController =
        TextEditingController(text: note != null ? note.email : '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(note != null ? 'Edit Note' : 'Create Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final int id =
                    note != null ? int.parse(idController.text) : 0;
                final String title = titleController.text;
                final int age = int.parse(ageController.text);
                final String description = descriptionController.text;
                final String email = emailController.text;

                if (note != null) {
                  final NotesModel updatedNote = NotesModel(
                    id: id,
                    title: title,
                    age: age,
                    description: description,
                    email: email,
                  );

                  await dbHelper!.updateNote(updatedNote);
                } else {
                  final NotesModel newNote = NotesModel(
                    title: title,
                    age: age,
                    description: description,
                    email: email,
                  );

                  await dbHelper!.insert(newNote);
                }

                setState(() {
                  notesList = dbHelper!.getNotesList();
                });

                Navigator.of(context).pop();
              },
              child: Text(note != null ? 'Update' : 'Create'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, int id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await dbHelper!.deleteNoteById(id);

                setState(() {
                  notesList = dbHelper!.getNotesList();
                });

                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: FutureBuilder<List<NotesModel>>(
        future: notesList,
        builder:
            (BuildContext context, AsyncSnapshot<List<NotesModel>> snapshot) {
          if (snapshot.hasData) {
            final List<NotesModel>? notes = snapshot.data;
            if (notes != null && notes.isNotEmpty) {
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) {
                  final NotesModel note = notes[index];
                  return ListTile(
                    title: Text('Title: ${note.title}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${note.id}'),
                        Text('Age: ${note.age}'),
                        Text('Description: ${note.description}'),
                        Text('Email: ${note.email}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(context, note);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteDialog(context, note.id!);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      _showEditDialog(context, note);
                    },
                    onLongPress: () {
                      _showDeleteDialog(context, note.id!);
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No notes available.'),
              );
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred while loading notes.'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog(context, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
