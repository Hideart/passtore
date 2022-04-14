import 'package:flutter/material.dart';
import 'package:passtore/src/widgets/themed-screen-wrapper.widget.dart';
import 'package:passtore/src/widgets/themed-text.widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ThemedScreenWrapper(
        margins: EdgeInsets.all(20),
        child: ThemedText('Test'),
      ),
    );
  }
}
