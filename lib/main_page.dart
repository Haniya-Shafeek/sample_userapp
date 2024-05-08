import 'package:flutter/material.dart';
import 'package:sampledemo_app/channels.dart';
import 'package:sampledemo_app/home.dart';
import 'package:sampledemo_app/profile.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List <Widget>pages = [Homepage(), Channelpage(), Profilepage()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          selectedItemColor: Colors.pink,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "Channels"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
          body: pages[currentindex],
    );
  }
}
