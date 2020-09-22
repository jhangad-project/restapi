import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restapi/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API "),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                getdata();
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(55, 0, 175, 0)),
                  child: Text("Click to get data")),
            ),
            Text("Number of results: " + data.length.toString())
          ],
        ),
        Flexible(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Tabs();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [draw(index, 'name'), Text("${index + 1} ")],
                      ),
                      draw(index, 'bizname'),
                      draw(index, 'description'),
                      draw(index, 'mobile'),
                      if (data[index]['mobile2'].toString().isNotEmpty)
                        draw(index, 'mobile2'),
                      draw(index, 'address'),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'Click to go on next screen !',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: data.length,
        )),
      ]),
    );
  }

  Widget draw(int index, String key) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Text(
          data[index][key],
          style: TextStyle(fontWeight: FontWeight.w300),
        ));
  }

  void getdata() async {
    // Fluttertoast.showToast(msg: "msg");
    String url = "http://thekarjat.com/karjat_app/alldata.json";
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    setState(() {
      data = json;
    });
    //print(json);
  }
}
