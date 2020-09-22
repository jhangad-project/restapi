import 'package:flutter/material.dart';
import 'package:restapi/hero_screen.dart';

class Tab3 extends StatefulWidget {
  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return HeroScreen();
                },
              ));
            },
            // Main route
            child: Hero(
              tag: 'hero',
              child: Icon(
                Icons.directions_transit,
                size: 50,
              ),
            ),
          ),
          Flexible(
            child: ListView(
              children: List.generate(
                  50,
                  (index) => Dismissible(
                        confirmDismiss: (direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Delete Confirmation"),
                                content: const Text(
                                    "Are you sure you want to delete this item?"),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text("Delete")),
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("Cancel"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        key: Key('item $index'),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "data ${index + 1}",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
