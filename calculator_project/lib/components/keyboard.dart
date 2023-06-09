// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator_project/components/button_row.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class Keyboard extends StatelessWidget {

    final void Function(String) cb;

  const Keyboard({
    Key? key,
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox (
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow(
            buttons: [
              Button.big(text: 'AC', cb: cb,),
              Button(text: '%',cb: cb,),
              Button.operation(text: '/',cb: cb,),
            ],),
          ButtonRow(
            buttons: [
              Button(text: '7',cb: cb,),
              Button(text: '8',cb: cb,),
              Button(text: '9',cb: cb,),
              Button.operation(text: 'x',cb: cb,)
            ],
          ),
          ButtonRow(
            buttons: [
              Button(text: '4',cb: cb,),
              Button(text: '5',cb: cb,),
              Button(text: '6',cb: cb,),
              Button.operation(text: '-',cb: cb,)
            ],),
            ButtonRow(
            buttons: [
              Button(text: '1',cb: cb,),
              Button(text: '2',cb: cb,),
              Button(text: '3',cb: cb,),
              Button.operation(text: '+',cb: cb,),
            ],),
            ButtonRow(
            buttons: [
              Button.big(text: '0',cb: cb,),
              Button(text: ',',cb: cb,),
              Button.operation(text: '=',cb: cb,),
            ],),
        ],
      ),
    );
  }
}
