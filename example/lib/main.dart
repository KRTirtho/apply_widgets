import 'package:apply_widgets/apply_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Text('Hello World!').apply(
          (s) => s
              .text(const TextStyle(color: Colors.blue))
              .p(20)
              .radius(BorderRadius.circular(10))
              .bgColor(Colors.red),
        ),
      ),
    );
  }
}
