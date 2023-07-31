import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            )),
            Row(
              children: <Widget>[
               
                customOutlinedButton("9"),
                customOutlinedButton("8"),
                customOutlinedButton("7"),
                customOutlinedButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("6"),
                customOutlinedButton("5"),
                customOutlinedButton("4"),
                customOutlinedButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("3"),
                customOutlinedButton("2"),
                customOutlinedButton("1"),
                customOutlinedButton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () => btnClick(val),
          child: Text(
            "$val",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0),
          )),
    );
  }

  late int first, secound;
  late String result, text = "";
  late String opp;
  void btnClick(String btnText) {
    if (btnText == "C") {
      result = "";
      first = 0;
      secound = 0;
      text = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "/" ||
        btnText == "X") {
      first = int.parse(text);
      result = "";
      opp = btnText;
    } else if (btnText == "=") {
      secound = int.parse(text);

      if (opp == "+") {
        result = (first + secound).toString();
      }
      if (opp == "-") {
        result = (first - secound).toString();
      }
      if (opp == "X") {
        result = (first * secound).toString();
      }
      if (opp == "/") {
        result = (first ~/ secound).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }
}
