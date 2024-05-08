import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sampledemo_app/model_class.dart';
import 'package:http/http.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<User>> fetchdetails() async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Conversations",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 233, 185, 201)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.pink,
                            ),
                            Text("Add New")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 38,
                  width: 370,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 234, 231, 231),
                      borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "search...."),
                  )),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                  future: fetchdetails(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Text("loading...");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("loading...");
                    }
                    if (snapshot.hasError) {
                      return const Text("error");
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.amber,
                              child: Center(
                                child: Text(
                                  snapshot.data![index].id.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Username : ${snapshot.data![index].username}"),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(snapshot.data![index].email)
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
