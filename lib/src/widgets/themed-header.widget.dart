import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/src/widgets/themed-text.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedHeaderData {
  final String title;
  final bool collapsable;
  final bool pinned;
  final bool applyBottomBorder;
  final Widget? rightContent;
  final double? collapsedHeight;
  final double? expandedHeight;
  final double titleScaleFactor;

  ThemedHeaderData({
    this.collapsable = true,
    this.pinned = false,
    this.applyBottomBorder = false,
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
  final bool applyBottomBorder;

  const ThemedHeader({
    Key? key,
    this.collapsable = true,
    this.pinned = false,
    this.rightContent,
    this.applyBottomBorder = false,
    this.collapsedHeight,
    this.expandedHeight,
    this.titleScaleFactor = 1.3,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    final double height = (this.collapsedHeight ?? AppMetrics.headerSize) +
        AppMetrics.defaultMargin * 2 +
        (this.rightContent != null ? AppMetrics.littleMargin * 2 : 0);
    const double expandMultiplier = 1.4;
    return SliverAppBar(
      elevation: 0,
      pinned: this.pinned,
      centerTitle: false,
      expandedHeight: height * expandMultiplier,
      collapsedHeight: height,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool topped =
              constraints.biggest.height == height * expandMultiplier ||
                  !this.pinned;
          return Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.darkBackgroundColor.withOpacity(
                      topped ? 1 : 0.7,
                    ),
                    border: this.applyBottomBorder
                        ? Border(
                            bottom: BorderSide(
                              width: 1.0,
                              color: theme.secondaryColor.withOpacity(
                                topped ? 0 : 1,
                              ),
                            ),
                          )
                        : null,
                  ),
                  child: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.all(
                      AppMetrics.defaultMargin,
                    ),
                    expandedTitleScale: this.titleScaleFactor,
                    title: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: AppMetrics.blurMultiplier,
                        sigmaY: AppMetrics.blurMultiplier,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ],
          );
        },
      ),
    );
  }
}
