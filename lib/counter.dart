import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Counter extends StatefulWidget {
  final String myCounter;

  Counter({Key key, this.myCounter}) : super(key: key);
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int my_counter;
  var rng = new Random();
  Color firstColor = new Color(0x66455452);

  List<String> wallpapers = [
    'mtgw-01.jpg',
    'mtgw-02.jpg',
    'mtgw-03.jpg',
    'mtgw-04.jpg',
    'mtgw-05.jpg',
    'mtgw-06.jpg',
    'mtgw-07.jpg',
    'mtgw-08.jpg',
    'mtgw-09.jpg',
    'mtgw-10.jpg',
  ];

  String imagePath;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    setState(() {
      my_counter = int.parse(widget.myCounter);
      imagePath = "images/${wallpapers[rng.nextInt(9)]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print(wallpapers[0]);
    print(rng.nextInt(9));
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(imagePath), fit: BoxFit.cover)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    margin: EdgeInsets.only(top: 110.0, bottom: 110.0),
                    decoration: BoxDecoration(color: firstColor),
                    child: IconButton(
                      padding: EdgeInsets.only(right: 40.0),
                      icon: Icon(
                        Icons.remove,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          my_counter--;
                        });
                        print(my_counter);
                      },
                    ),
                  ),
                  Container(
                    width: 150.0,
                    margin: EdgeInsets.only(top: 110.0, bottom: 110.0),
                    decoration: BoxDecoration(color: firstColor),
                    child: Center(
                      child: Text(
                        "${my_counter}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          shadows: [
                            Shadow(offset: Offset(1.7, 1.7), color: Colors.black),
                            Shadow(offset: Offset(-1.7, -1.7), color: Colors.black),
                            Shadow(offset: Offset(-1.7, 1.7), color: Colors.black),
                            Shadow(offset: Offset(1.7, -1.7), color: Colors.black),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20.0),
                    margin: EdgeInsets.only(top: 110.0, bottom: 110.0),
                    decoration: BoxDecoration(color: firstColor),
                    child: IconButton(
                      padding: EdgeInsets.only(left: 10.0),
                      icon: Icon(
                        Icons.add,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          my_counter++;
                        });
                        print(my_counter);
                      },
                    ),
                  )
                ],
              ),
            )));
  }
}
