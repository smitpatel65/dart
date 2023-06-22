import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/stream.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<List<Post>> _apiDataStreamController =
      StreamController<List<Post>>.broadcast();

  Stream<List<Post>> get apiDataStream => _apiDataStreamController.stream;

  @override
  void dispose() {
    _apiDataStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Stream Demo'),
      ),
      body: Center(
        child: StreamBuilder<List<Post>>(
          stream: apiDataStream,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            final List<Post> posts = snapshot.data!;
            // Display the data in your UI
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final Post post = posts[index];
                return ListTile(
                  trailing: Text('ID: ${post.id}'),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchDataFromAPI();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void fetchDataFromAPI() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Post> posts =
            jsonData.map((data) => Post.fromJson(data)).toList();
        _apiDataStreamController.add(posts);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      _apiDataStreamController.addError(e);
    }
  }
}
