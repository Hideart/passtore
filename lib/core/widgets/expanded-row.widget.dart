import 'package:flutter/material.dart';

class ExpandedRow extends StatelessWidget {
  final Widget child;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const ExpandedRow({
    Key? key,
    required this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: this.crossAxisAlignment,
      mainAxisAlignment: this.mainAxisAlignment,
      children: [
        Expanded(child: this.child),
      ],
    );
  }
}
