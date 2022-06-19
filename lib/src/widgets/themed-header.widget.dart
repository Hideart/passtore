import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/src/widgets/themed-text.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedHeaderData {
  final String title;
  final bool collapsable;
  final bool pinned;
  final Widget? rightContent;
  final double? collapsedHeight;
  final double? expandedHeight;
  final double titleScaleFactor;

  ThemedHeaderData({
    this.collapsable = true,
    this.pinned = false,
    this.rightContent,
    this.collapsedHeight,
    this.expandedHeight,
    this.titleScaleFactor = 1.3,
    required this.title,
  });
}

class ThemedHeader extends StatelessWidget {
  final String title;
  final bool collapsable;
  final bool pinned;
  final Widget? rightContent;
  final double? collapsedHeight;
  final double? expandedHeight;
  final double titleScaleFactor;

  const ThemedHeader({
    Key? key,
    this.collapsable = true,
    this.pinned = false,
    this.rightContent,
    this.collapsedHeight,
    this.expandedHeight,
    this.titleScaleFactor = 1.3,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;

    return SliverAppBar(
      elevation: 0,
      pinned: this.pinned,
      centerTitle: false,
      expandedHeight: this.collapsable
          ? this.expandedHeight ?? AppMetrics.headerExpandSize
          : null,
      collapsedHeight: this.collapsedHeight,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double top = constraints.biggest.height;
          return Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppMetrics.defaultMargin,
                  ),
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
                    expandedTitleScale: this.titleScaleFactor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThemedText(
                          this.title,
                          type: ThemedTextType.primary,
                          style: const TextStyle(
                            fontSize: AppMetrics.titleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          child: this.rightContent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
