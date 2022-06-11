import 'package:flutter/material.dart';

class WeedColors {
  const WeedColors._();

  static const goldBrown = Color(0xFFA59685);
  static const darkBlue = Color(0xFF111E27);
  static const modalBackgroundColor = Color.fromRGBO(0, 0, 0, 0.7);
  static final frostBackground = Colors.white.withOpacity(0.5);
  static final frostBackgroundDark = Colors.black.withOpacity(0.17);
  static const blueGrey = Color(0xFF859AA5);
  static const cursorBlue = Color(0xFF007AFF);
  static const inactiveWhite = Color.fromRGBO(255, 255, 255, 0.32);
  static const translucentWhite = Color.fromRGBO(255, 255, 255, 0.08);
  static const darkGrey = Color(0xFF343434);
  static const grey = Color(0xFFC2C2C2);
  static const iceBlue = Color(0xFF84C8FF);

  static const primaryPowerSwitchGradient = LinearGradient(
    colors: [
      Color.fromRGBO(250, 104, 104, 0.28),
      Color.fromRGBO(250, 104, 104, 0.18),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  //New Colors introduced in the MVP designs
  static const warmGreyFog = Color(0xFFFDFDFD);
  static const warmGreyExtraLight = Color(0xFFFBFAF9);
  static const warmGreyLight = Color(0xFFEBEAE8);
  static const warmGreyMedium = Color(0xFFD4D0CC);

  static const warmGreyDark = Color(0xFFACA7A1);
  static const charcoalBlack = Color(0xFF141311);
  static const charcoalDark = Color(0xFF242424);
  static const charcoalMedium = Color(0xFF414141);
  static const charcoalLight = Color(0xFFA4A4A4);
  static const systemOrange = Color(0xFFE48148);
  static const systemGreen = Color(0xFF69CA5D);
  static const systemRed = Color(0xFF9F042B);
  static const systemWarningRed = Color(0xFFFD4825);
  static const black60 = Color.fromRGBO(0, 0, 0, 0.6);
  static const black08 = Color.fromRGBO(0, 0, 0, 0.08);
  static const black06 = Color.fromRGBO(0, 0, 0, 0.06);
  static const lightGrainColor = Color(0xFFF4F3F1);

  static const nightGrey = Color(0xFF525252);
}
