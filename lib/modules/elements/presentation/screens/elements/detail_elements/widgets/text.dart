import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  TextCustom({super.key, this.title});

  String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title ?? '',
        textAlign: TextAlign.start, style: const TextStyle(fontSize: 20));
  }
}
