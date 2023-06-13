import 'package:flutter/material.dart';
import 'package:my_app/firebase/posts/app_postsi.dart';
import 'package:my_app/firebase/screen/login_screen.dart';
import '../../utils/next_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
        actions: [
          IconButton(
            onPressed: () {
              nextScreenReplace(context, const LoginScreen());
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextScreenReplace(context, const PostsScreen());
        },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
      ),
    );
  }
}
