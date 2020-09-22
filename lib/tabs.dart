import 'package:flutter/material.dart';
import 'package:restapi/tabs/tab1.dart';
import 'package:restapi/tabs/tab2.dart';
import 'package:restapi/tabs/tab3.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  TabController tc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tc = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.blue,
        child: TabBar(
          controller: tc,
          tabs: [
            Text("One"),
            Text("Two"),
            Text("Three"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tc,
        children: [Tab1(), Tab2(), Tab3()],
      ),
    );
  }
}
