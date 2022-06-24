import 'package:flutter/material.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedScreenWrapper extends StatefulWidget {
  final List<Widget> children;
  final ThemedHeaderData? header;
  final double expandedHeight = 100.0;
  final PageStorageKey<String>? contentKey;
  final bool enableSafeAreaTop;
  final bool enableSafeAreaBottom;

  const ThemedScreenWrapper({
    Key? key,
    this.header,
    required this.children,
    this.contentKey,
    this.enableSafeAreaBottom = true,
    this.enableSafeAreaTop = true,
  }) : super(key: key);

  @override
  State<ThemedScreenWrapper> createState() => _ThemedScreenWrapperState();
}

class _ThemedScreenWrapperState extends State<ThemedScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    final safeArea = MediaQuery.of(context).padding;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.darkBackgroundColor, theme.darkBackgroundColor],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
        ),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: CustomScrollView(
            key: this.widget.contentKey,
            slivers: <Widget>[
              this.widget.header != null
                  ? ThemedHeader(
                      title: this.widget.header!.title,
                      pinned: this.widget.header!.pinned,
                      collapsable: this.widget.header!.collapsable,
                      rightContent: this.widget.header!.rightContent,
                      expandedHeight: this.widget.header!.expandedHeight,
                      collapsedHeight: this.widget.header!.collapsedHeight,
                      applyBottomBorder: this.widget.header!.applyBottomBorder,
                    )
                  : const SliverPadding(padding: EdgeInsets.all(0)),
              SliverPadding(
                padding: EdgeInsets.only(
                  top: this.widget.header == null &&
                          this.widget.enableSafeAreaTop
                      ? safeArea.top
                      : 0,
                  bottom:
                      this.widget.enableSafeAreaBottom ? safeArea.bottom : 0,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => this.widget.children[index],
                    childCount: this.widget.children.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
