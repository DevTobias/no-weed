import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';

class SplitInfoCard extends StatelessWidget {
  const SplitInfoCard({
    Key? key,
    required this.top,
    required this.bottom,
  }) : super(key: key);

  final Widget top;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          top,
          _divider,
          bottom,
        ],
      ),
      decoration: _cardDecoration,
    );
  }

  Widget get _divider => Divider(
        color: WeedColors.warmGreyLight,
        thickness: 1.5,
        endIndent: 20,
        indent: 20,
      );

  BoxDecoration get _cardDecoration => BoxDecoration(
        border: Border.all(
          color: WeedColors.warmGreyLight,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
}
