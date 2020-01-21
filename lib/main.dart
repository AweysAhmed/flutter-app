import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();

  final interestRateController = TextEditingController();
  final yearsController = TextEditingController();
  final itemCostController = TextEditingController();
  final purchasedItemController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    interestRateController.dispose();
    yearsController.dispose();
    itemCostController.dispose();
    purchasedItemController.dispose();

    super.dispose();
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Oh. You need a little dummy text for your mockup? How quaint. I bet you’re still using Bootstrap too…",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    controller: purchasedItemController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'What did you buy?',
                    ),
                    validator: (input) =>
                        input.length <= 2 ? "not valid" : null,
                  ),
                  TextFormField(
                    controller: itemCostController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'How much did it cost?',
                    ),
                    validator: (input) =>
                        int.parse(input) <= 0 ? "not valid" : null,
                  ),
                  TextFormField(
                    controller: yearsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'How many years in the future?',
                    ),
                    validator: (input) =>
                        int.parse(input) <= 0 ? "not valid" : null,
                  ),
                  TextFormField(
                    controller: interestRateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Estimated Rate of Return',
                    ),
                    validator: (input) =>
                        int.parse(input) <= 0 ? "Not Valid" : null,
                  ),
                  RaisedButton(
                    child: Text("Calculate"),
                    onPressed: submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  futureValue(interest, year, cost) {
    double interestAndOne = 1 + (interest / 100);
    double fV = cost * pow(interestAndOne, year);
    return fV;
  }

  void submit() {
    // var purchasedItem = purchasedItemController.text;
    var itemCost = int.parse(itemCostController.text);
    var years = int.parse(yearsController.text);
    var interestRate = int.parse(interestRateController.text);
    if (formKey.currentState.validate()) {
      print(futureValue(interestRate, years, itemCost));
    }
  }
}
