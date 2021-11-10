import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Homework2_2 extends StatelessWidget {
  const Homework2_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shapes',
      home: Homework(),
    );
  }
}

class Homework extends StatefulWidget {
  const Homework({Key? key}) : super(key: key);

  @override
  _HomeworkState createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {
  String inputText = 'Please input a number to '
      'see if it is square or '
      'triangular';

  TextEditingController controller = TextEditingController();
  List<String> listOfMessages = [
    "is neither TRIANGULAR or SQUARE",
    "is SQUARE",
    "is TRIANGULAR",
    "is both SQUARE or TRIANGULAR"
  ];
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Number Shapes'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.done),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 5.0),
            child: Text(
              inputText,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'Type a number',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: false),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    int? textFieldToInt = int.tryParse(controller.value.text);

    if (textFieldToInt != null) {
      setState(() {
        errorText = null;
      });
      if (isSquare(textFieldToInt) && isTriangle(textFieldToInt)) {
        resultAlertDialog(context, textFieldToInt, listOfMessages[3]);
      } else if (isTriangle(textFieldToInt)) {
        resultAlertDialog(context, textFieldToInt, listOfMessages[2]);
      } else if (isSquare(textFieldToInt)) {
        resultAlertDialog(context, textFieldToInt, listOfMessages[1]);
      } else {
        resultAlertDialog(context, textFieldToInt, listOfMessages[0]);
      }
      controller.clear();
    } else {
      setState(() {
        errorText = "Please type a number";
      });
    }
  }

  bool isSquare(int number) {
    for (int i = 0; i * i <= number; i++) {
      if (i * i == number) {
        return true;
      }
    }
    return false;
  }

  bool isTriangle(int number) {
    for (int i = 0; i * i * i <= number; i++) {
      if (i * i * i == number) {
        return true;
      }
    }
    return false;
  }

  void resultAlertDialog(BuildContext context, int number, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('$number'),
              content: Text('Number $number ' + text),
            ));
  }
}
