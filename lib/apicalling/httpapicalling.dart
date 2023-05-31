import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/httpapi.dart';

class Userdata extends StatefulWidget {
  const Userdata({super.key});

  @override
  State<Userdata> createState() => _UserdataState();
}

class _UserdataState extends State<Userdata> {
  List<UserDetails> userDetails = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: userDetails.length,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                margin: const EdgeInsets.only(bottom: 10),
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(index, 'ID: ', userDetails[index].id.toString()),
                    getText(
                        index, 'Name: ', userDetails[index].name.toString()),
                    getText(
                        index, 'Email: ', userDetails[index].email.toString()),
                    getText(
                        index, 'Phone: ', userDetails[index].phone.toString()),
                    getText(index, 'Website: ',
                        userDetails[index].website.toString()),
                    getText(index, 'Company Name: ',
                        userDetails[index].company!.name.toString()),
                    getText(index, 'Addres: ',
                        ' ${userDetails[index].address!.suite.toString()},${userDetails[index].address!.street.toString()}, ${userDetails[index].address!.city.toString()} - ${userDetails[index].address!.zipcode.toString()}'),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Text getText(int index, String fildName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: fildName,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      TextSpan(
          text: content,
          style: const TextStyle(fontSize: 16, color: Colors.black)),
    ]));
  }

  Future<List<UserDetails>> getdata() async {
    userDetails = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userDetails.add(UserDetails.fromJson(index));
      }
      return userDetails;
    } else {
      return userDetails;
    }
  }
}
