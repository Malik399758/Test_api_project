

import 'package:flutter/material.dart';

enum ButtonState {
  idle,
  loading,
  success,
  error,
}

class EnumExampleApp extends StatefulWidget {
  @override
  _EnumExampleAppState createState() => _EnumExampleAppState();
}

class _EnumExampleAppState extends State<EnumExampleApp> {
  ButtonState state = ButtonState.idle;

  void changeState() {
    setState(() {
      if (state == ButtonState.idle) {
        state = ButtonState.loading;
      } else if (state == ButtonState.loading) {
        state = ButtonState.success;
      } else if (state == ButtonState.success) {
        state = ButtonState.error;
      } else {
        state = ButtonState.idle;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String text;
    if (state == ButtonState.idle) {
      text = "Click Me";
    } else if (state == ButtonState.loading) {
      text = "Loading...";
    } else if (state == ButtonState.success) {
      text = "Success ✅";
    } else {
      text = "Error ❌";
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Enum Example")),
        body: Center(
          child: ElevatedButton(
            onPressed: changeState,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(EnumExampleApp());
}
