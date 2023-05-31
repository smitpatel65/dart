import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firebase/auth/verify_code.dart';
import 'package:my_app/firebase/screen/round_button.dart';
import 'package:my_app/utils/utils.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final phoneNumberController = TextEditingController();
  bool loding = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login With Number')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '+1 312 4576 089',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                tital: 'Login',
                loading: loding,
                ontep: () {
                  setState(() {
                    loding = true;
                  });
                  auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_) {
                      debugPrint("verificationCompleted------");
                      setState(() {
                        loding = false;
                      });
                    },
                    verificationFailed: (e) {
                      debugPrint("verificationFailed------");

                      setState(() {
                        loding = false;
                      });

                      Utils().toastMessage(e.toString());
                    },
                    codeSent: (String verificationID, int? token) {
                      debugPrint("here in code sent------");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyCodeScreen(
                            verificationID: verificationID,
                          ),
                        ),
                      );
                      setState(() {
                        loding = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      debugPrint("codeAutoRetrievalTimeout------");

                      Utils().toastMessage(e.toString());
                      setState(() {
                        loding = false;
                      });
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
