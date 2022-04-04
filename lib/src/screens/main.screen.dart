import 'package:flutter/material.dart';
import 'package:passtore/core/widgets/app-lifecycle.widget.dart';
import 'package:passtore/src/widgets/themed-screen-wrapper.widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreenWrapper(
      margins: const EdgeInsets.all(20),
      child: Column(
        children: const [
          AppLifecycleReactor(),
        ],
      ),
    );
  }
}
