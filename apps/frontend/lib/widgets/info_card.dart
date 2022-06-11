import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: body,
      decoration: _cardDecoration,
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
        border: Border.all(
          color: WeedColors.warmGreyLight,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
}
