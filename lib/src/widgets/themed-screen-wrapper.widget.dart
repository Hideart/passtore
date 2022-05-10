import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedScreenWrapper extends StatelessWidget {
  final List<Widget> children;
  final ThemedHeaderData? header;
  final double expandedHeight = 100.0;

  const ThemedScreenWrapper({Key? key, this.header, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ThemeChangable(
          builder: (themeContext, theme) => Container(
            key: ValueKey(theme.name),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.darkBackgroundColor, theme.darkBackgroundColor],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
          ),
        ),
        SafeArea(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: CustomScrollView(
              slivers: <Widget>[
                this.header != null
                    ? ThemedHeader(
                        title: this.header!.title,
                        pinned: this.header!.pinned,
                        collapsable: this.header!.collapsable,
                      )
                    : const SizedBox(),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => this.children[index],
                    childCount: this.children.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
