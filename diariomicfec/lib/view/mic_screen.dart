import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MicScreen extends StatefulWidget {
  @override
  _MicScreenState createState() => _MicScreenState();
}

class _MicScreenState extends State<MicScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //! Tem que declarar a quantidade tabs
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Image(
                    image: AssetImage('assets/images/urine.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Tab(
                  child: Image(
                    image: AssetImage('assets/images/hist.png'),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            'Miccional',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          //centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Page 1")),
            Center(child: Text("Page 2")),
          ],
        ),
      ),
    );
  }
}
