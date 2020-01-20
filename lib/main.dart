import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void futureValueResult() {
    setState(() {
      //function to calculate futre value
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green[700]),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "How much did that really cost?",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Oh. You need a little dummy text for your mockup? How quaint. I bet you’re still using Bootstrap too…",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'What did you buy?',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'How much did it cost?',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'How many years in the future?',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Estimated Rate of Return',
                  ),
                ),
                RaisedButton(
                  child: Text("Calculate"),
                  onPressed: null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
