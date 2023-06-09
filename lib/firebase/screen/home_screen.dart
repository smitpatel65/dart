import 'package:flutter/material.dart';
import 'package:my_app/firebase/screen/login_screen.dart';
// import 'package:my_app/firebase/screen/login_screen.dart';
// import 'package:my_app/utils/next_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/sige_in_provider.dart';
import '../../utils/next_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getdata() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();

    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("${sp.imageUrl}"),
            radius: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome ${sp.name}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${sp.email}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            "${sp.uid}",
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("PROVIDER:"),
              const SizedBox(
                width: 5,
              ),
              Text("${sp.provider}".toUpperCase(),
                  style: const TextStyle(color: Colors.red)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                sp.userSignOut();
                nextScreenReplace(context, const LoginScreen());
              },
              child: const Text("SIGNOUT",
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      )),
    );
  }
}
