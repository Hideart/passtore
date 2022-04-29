import 'package:flutter/material.dart';
import 'package:passtore/src/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemedScreenWrapper(
        margins: const EdgeInsets.all(20),
        child: ThemedButton(
          text: 'Test',
          onTap: () => print('tapped'),
        ),
      ),
    );
  }
}
