import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final List data;
  final int index;

  //adding constructor
  MyCard({this.data, this.index});

  @override
  Widget build(BuildContext context) {
    var string = data[index]["description"];
    if (string.length > 30) {
      string = string.substring(0, 30);
    }
    var name = "";
    (data[index]["gender"] == "Male") ? name = "Mr" : name = "Ms";
    return new Card(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(data[index]["image"]),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Text(
                name +
                    " " +
                    data[index]["first_name"] +
                    " " +
                    data[index]["last_name"],
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(string),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
