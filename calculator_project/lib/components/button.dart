import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const Dark = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);
  final String text;
  final bool big;
  final Color tinta;

  final void Function(String) cb;

  

  const Button({
    Key? key, 
    required this.cb,
    required this.text,
    this.big = false,
    this.tinta=DEFAULT,
  }) : super(key: key);

  const Button.big({
    Key? key,
    required this.cb,
    required this.text,
    this.big = true,
    this.tinta=DEFAULT,
  }) : super(key: key);

  const Button.operation({
    Key? key,
    required this.cb,
    required this.text,
    this.big = false,
    this.tinta=OPERATION,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(.4),
        child: ElevatedButton(
          onPressed: () => cb(text),
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(tinta),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero))
          ),
          
          
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
