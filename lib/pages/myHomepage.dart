
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const name = "adam";
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.person), // Leading icon of a person
          onPressed: () {
            // Handle leading icon press
          },
        ),
        title: const Text(
          'Welcome $name, lets get started',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 19,
              color: Colors.white
          ),
        ),
        centerTitle: true, // This centers the title
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.menu), // Ending icon of a menu
            color: Colors.grey, // This makes the popup menu grey
            onSelected: (String result) {
              // Handle menu selection
              if (result == 'Sacco List') {
                Navigator.pushNamed(context, 'sacco_list');
              } else if (result == 'Members') {
                Navigator.pushNamed(context, 'members');
              }
              else if (result == 'Survey List') {
                Navigator.pushNamed(context, 'survey_list');
              }
              else if (result == 'Items') {
                Navigator.pushNamed(context, 'items');
              }
              // Add more items as needed
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Sacco List',
                child: Text(
                  'Sacco List',
                  style: TextStyle(color: Colors.white), // This makes the text white
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Members',
                child: Text(
                  'Members',
                  style: TextStyle(color: Colors.white), // This makes the text white
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Survey List',
                child: Text(
                  'Survey List',
                  style: TextStyle(color: Colors.white), // This makes the text white
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Items',
                child: Text(
                  'Items',
                  style: TextStyle(color: Colors.white), // This makes the text white
                ),
              ),
              // Add more items as needed
            ],
          ),
        ],
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        flexibleSpace: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.2),
          child: Container(),
        ),
      ),
      body: Container(

      ),
    );
  }




}
