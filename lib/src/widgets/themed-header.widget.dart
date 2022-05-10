import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/src/widgets/themed-text.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedHeaderData {
  final String title;
  final bool collapsable;
  final bool pinned;

  ThemedHeaderData({
    required this.title,
    this.collapsable = true,
    this.pinned = false,
  });
}

class ThemedHeader extends StatelessWidget {
  final String title;
  final bool collapsable;
  final bool pinned;

  const ThemedHeader({
    Key? key,
    this.collapsable = true,
    this.pinned = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: this.pinned,
      centerTitle: false,
      expandedHeight: this.collapsable ? AppMetrics.headerExpandSize : null,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double top = constraints.biggest.height;
          return ThemeChangable(
            builder: (context, theme) => Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.darkBackgroundColor,
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: theme.secondaryColor.withOpacity(
                            top == AppMetrics.headerExpandSize || !this.pinned
                                ? 0
                                : 1,
                          ),
                        ),
                      ),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.none,
                      expandedTitleScale: 1.3,
                      centerTitle: false,
                      titlePadding: const EdgeInsets.all(
                        AppMetrics.defaultMargin,
                      ),
                      title: ThemedText(
                        this.title,
                        type: ThemedTextType.primary,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: AppMetrics.titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
