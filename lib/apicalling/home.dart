import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/apicalling.dart';

class ApiColling extends StatefulWidget {
  const ApiColling({super.key});

  @override
  State<ApiColling> createState() => _ApiCollingState();
}

class _ApiCollingState extends State<ApiColling> {
  List<CalingApi> collingApi = [];
  //CollingApi apicoll = CollingApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Title(
                color: Colors.black,
                child: const Text(
                  'Api Calling',
                  style: TextStyle(fontSize: 30),
                )),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: getApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: collingApi.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    // width: 200,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('userId : ${collingApi[index].userId}',
                            style: const TextStyle(fontSize: 18)),
                        Text('id : ${collingApi[index].id}',
                            style: const TextStyle(fontSize: 18)),
                        Text('title : ${collingApi[index].title}',
                            maxLines: 1, style: const TextStyle(fontSize: 18)),
                        Text('body : ${collingApi[index].body}',
                            maxLines: 1, style: const TextStyle(fontSize: 18)),
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
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: Border.all(color: Colors.black),
                shadowColor: Colors.black,
                backgroundColor: Colors.blueGrey,
                title: const Text('Add Data',
                    style: TextStyle(color: Colors.white)),
                actions: [
                  TextField(
                    onChanged: (vaL) {
                    },
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Enter Title"),
                  ),
                  TextField(
                    onChanged: (vaL) {
                    },
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Enter Body"),
                  ),
                  TextButton(
                    onPressed: () async{
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Add Data',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 251, 99, 4),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<CalingApi>> getApi() async {
    collingApi = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        collingApi.add(CalingApi.fromJson(index));
      }
      return collingApi;
    } else {
      return collingApi;
    }
  }
}

Future<String> postData(Map<String, dynamic> data) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(data);

  final response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 201) {
    return 'success';
  } else {
    throw Exception('Failed to post data');
  }
}
