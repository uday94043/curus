import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'MyCard.dart';
import 'SpeechScreen.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("sampledata/mock_data.json");

    this.setState(() {
      data = json.decode(response);
    });

    print(data[1]["first_name"]);

    return "Success!";
  }

  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Patients"), backgroundColor: Colors.black),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return MyCard(data: data, index: index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mic),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpeechScreen()),
          );
        },
      ),
    );
  }
}
