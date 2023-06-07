import 'package:flutter/material.dart';
import 'package:my_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  //suffix: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  //suffix: const Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  authProvider.login(emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Login Successfully..."),
                    backgroundColor: Colors.blue,
                  ));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: authProvider.loding
                          ? const CircularProgressIndicator()
                          : const Text(
                              'login',
                              style: TextStyle(fontSize: 20),
                            )),
                ),
              )
            ],
          ),
        ));
  }
}
