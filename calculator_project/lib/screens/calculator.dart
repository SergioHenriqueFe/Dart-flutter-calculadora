import '../components/display.dart';
import 'package:calculator_project/components/keyboard.dart';
import 'package:calculator_project/models/memory.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  void pressedButtonKeybord(String command) {
    setState(() {
      memory.applycommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Column(
        children: <Widget>[
          Display(text: memory.value),
          Keyboard(cb: pressedButtonKeybord),
        ],
      ),
    );
  }
}
