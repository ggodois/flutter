import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text('I Am Little Monster'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/lady-gaga.png'),
          ),
        ),
      ),
    ),
  );
}
