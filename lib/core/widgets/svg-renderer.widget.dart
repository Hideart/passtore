import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:passtore/src/widgets/themed-text.widget.dart';

class SvgRenderer extends StatefulWidget {
  const SvgRenderer({
    Key? key,
    required this.name,
    required this.svgString,
    this.width,
    this.height,
  }) : super(key: key);

  final String name;
  final String svgString;
  final double? width;
  final double? height;

  @override
  State<SvgRenderer> createState() => _SvgRendererState();
}

class _SvgRendererState extends State<SvgRenderer> {
  String? svgPicture;
  bool error = false;

  @override
  void initState() {
    super.initState();
    final SvgParser parser = new SvgParser();
    try {
      parser.parse(this.widget.svgString, warningsAsErrors: true);
    } catch (err) {
      setState(() {
        error = true;
      });

      // ignore: avoid_print
      print('${this.widget.name}: Svg parsing error: $err');
    }
    setState(() {
      svgPicture = this.widget.svgString;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.error) {
      return ThemedText('ERROR.SVG'.tr());
    }
    return Column(
      children: [
        SvgPicture.string(
          this.svgPicture!,
          width: this.widget.width,
          height: this.widget.height,
        ),
      ],
    );
  }
}
