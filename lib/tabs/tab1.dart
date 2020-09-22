import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  List data = [];
  var name = TextEditingController();
  var age = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Data to Server"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: age,
                      decoration: InputDecoration(
                        labelText: "Age",
                        labelStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                putdata();
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(55, 0, 175, 0)),
                  child: Text("Put data to server")),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('${index + 1}'),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text(data[index]['name']),
                            flex: 5,
                          ),
                          Expanded(
                            child: Text(data[index]['age']),
                            flex: 5,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void putdata() async {
    if (name.text.length > 0 && age.text.length > 0) {
      var d = {'name': '${name.text}', 'age': '${age.text}'};
      var response =
          await http.post('http://thekarjat.com/flutter/push.php', body: d);
      print(response.body);
      getdata();
      name.text = '';
      age.text = '';
    } else {
      Fluttertoast.showToast(msg: 'Fill both the fields !');
    }
  }

  void getdata() async {
    // Fluttertoast.showToast(msg: "msg");
    String url = "http://thekarjat.com/flutter/get.php";
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    setState(() {
      data = json;
    });
  }
}
