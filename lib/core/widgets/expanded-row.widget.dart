import 'package:flutter/material.dart';

class ExpandedRow extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const ExpandedRow({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: this.crossAxisAlignment,
      mainAxisAlignment: this.mainAxisAlignment,
      children: [
        ...this
            .children
            .map(
              (child) => Expanded(child: child),
            )
            .toList(),
      ],
    );
  }
}
