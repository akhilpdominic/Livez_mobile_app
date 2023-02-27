import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final String text;
  ElevatedCard(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.blue,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}