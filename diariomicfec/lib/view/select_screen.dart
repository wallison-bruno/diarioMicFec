import 'package:diariomicfec/view/mic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.green,
                ]),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 30),
              width: 400,
              height: 280,
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      child: Image(
                        image: AssetImage('assets/images/poop.png'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 45.0, 0.0, 0.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 40),
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: Center(
                              child: Text(
                                'fecal'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.only(right: 5),
                      child: Image(
                        image: AssetImage('assets/images/urine.png'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => MicScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 50),
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: Center(
                              child: Text(
                                'Miccional'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
