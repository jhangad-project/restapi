import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  child: Text(
                    "Click",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromARGB(100, 255, 0, 0),
                  onPressed: () {
                    setState(() {
                      opacity = 1.0;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: opacity,
                  child: Text("This text will fade in."),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
