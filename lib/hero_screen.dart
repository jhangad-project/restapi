import 'package:flutter/material.dart';

class HeroScreen extends StatefulWidget {
  @override
  _HeroScreenState createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation Example"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Hero(
                tag: "hero",
                child: Icon(
                  Icons.directions_transit,
                  size: 100,
                ),
              ),
            ),
            ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: Text(
                "Scale Animation",
                style: TextStyle(color: Colors.amber),
              ),
            ),
            CircleAvatar(
              foregroundColor: Colors.white,
              child: Text("Text on circle"),
              backgroundImage:
                  NetworkImage('http://thekarjat.com/jhangad/c1.jpg'),
              radius: 50,
              backgroundColor: Colors.blue,
            ),
            Flexible(
              child: ListWheelScrollView(
                itemExtent: 100,
                children:
                    List.generate(50, (index) => Text('${index + 1} Data')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
