import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'counter.dart';

void main() => runApp(MaterialApp(
      title: "Principal",
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();
  Color firstColor = new Color(0x66ff9900);
  Color secondColor = new Color(0x66ffffff);
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MTG Counter",
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("images/mtg_wallpaper.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              Text(
                "Magic \nCounter",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: "Magic",
                    fontSize: 50.0,
                    shadows: [
                      Shadow(offset: Offset(1.7, 1.7), color: Colors.black),
                      Shadow(offset: Offset(-1.7, -1.7), color: Colors.black),
                      Shadow(offset: Offset(-1.7, 1.7), color: Colors.black),
                      Shadow(offset: Offset(1.7, -1.7), color: Colors.black),
                    ]),
              ),
              TextField(
                controller: _textController,
                style: TextStyle(color: Colors.white, fontSize: 30),
                keyboardType: TextInputType.numberWithOptions(),
                textAlign: TextAlign.center,
                decoration:
                  InputDecoration(
                    errorText: _validate ? 'Value Cant Be Empty': null,
                    hintText: 'Enter the starting life total for MTG',
                    hintStyle: TextStyle(
                      color: secondColor
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: firstColor
                      )
                    )
                  ),
              ),
              RaisedButton(
                color: firstColor,
                child: Text(
                  "Start",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, fontFamily: "Magic"),
                ),
                onPressed: () {
                  if(!_textController.text.isEmpty){
                    _validate = false;
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new Counter(
                        myCounter: _textController.text,
                      ),
                    );

                    Navigator.of(context).push(route);
                  }else{
                    _validate = true;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
