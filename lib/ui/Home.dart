import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  /*
Source : https://www.livescience.com/33356-weight-on-planets-mars-moon.html
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06*/
  int radioValue = 0;
  double _finalWeightValue = 0.0;
  String _formatedMessage = "";
  final TextEditingController _weightValueController =
      new TextEditingController();

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 0:
          _finalWeightValue =
              calculateWeight(_weightValueController.text, 0.06);
          _formatedMessage = "Your Weight on Pluto is $_finalWeightValue";
          break;
        case 1:
          _finalWeightValue =
              calculateWeight(_weightValueController.text, 0.38);
          _formatedMessage = "Your Weight on Mars is $_finalWeightValue";
          break;
        case 2:
          _finalWeightValue =
              calculateWeight(_weightValueController.text, 0.91);
          _formatedMessage = "Your Weight on Venus is $_finalWeightValue";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: new Text(
          "Weight on Planet",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 20.20),
        ),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(10.00),
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              width: 150.00,
              height: 150.00,
            ),
            new Container(
              margin: EdgeInsets.all(10.00),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightValueController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "In Ponds",
                        hintStyle:
                            new TextStyle(color: Colors.white, fontSize: 25.00),
                        fillColor: Colors.white,
                        labelText: "Your weight on Earth",
                        labelStyle:
                            new TextStyle(color: Colors.black, fontSize: 30.00),
                        icon: new Icon(
                          Icons.line_weight,
                          size: 25.00,
                        )),
                  ),
                  new Padding(padding: EdgeInsets.all(20.00)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: TextStyle(
                            fontSize: 25.00,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      new Radio(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: TextStyle(
                            fontSize: 25.00,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      new Radio(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: TextStyle(
                            fontSize: 25.00,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(20.00)),
                  new Text(
                    _weightValueController.text.isEmpty
                        ? "Please enter weight"
                        : _formatedMessage + " lbs",
                    // "$_formatedMessage",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20.00),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double mass) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * mass;
    } else {
      return 0.0;
    }
  }
}
