import 'package:flutter/material.dart';

class ExpandedRow extends StatelessWidget {
  final Widget child;
  const ExpandedRow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: this.child),
      ],
    );
  }
}
