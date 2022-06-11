import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/theme/weed_colors.dart';
import 'package:frontend/theme/weed_system_ui_style.dart';
import 'package:frontend/theme/weed_text_style.dart';

class WeedTheme {
  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: WeedColors.warmGreyFog,
          secondary: WeedColors.warmGreyMedium,
        ),
        primaryColor: WeedColors.warmGreyFog,
        backgroundColor: WeedColors.charcoalBlack,
        canvasColor: WeedColors.charcoalDark,
        scaffoldBackgroundColor: WeedColors.charcoalBlack,
        appBarTheme: _appBarTheme(
          WeedColors.warmGreyFog,
          WeedSystemUiStyle.light,
        ),
        fontFamily: "Roboto",
        textTheme: WeedTextThemeDefinition.lightTextTheme,
        iconTheme: _iconThemeData(WeedColors.warmGreyFog),
      );

  static ThemeData getLightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: WeedColors.charcoalBlack,
          secondary: WeedColors.charcoalMedium,
        ),
        primaryColor: WeedColors.charcoalBlack,
        backgroundColor: WeedColors.warmGreyFog,
        canvasColor: WeedColors.warmGreyFog,
        scaffoldBackgroundColor: WeedColors.warmGreyFog,
        appBarTheme: _appBarTheme(
          WeedColors.charcoalBlack,
          WeedSystemUiStyle.dark,
        ),
        fontFamily: "Roboto",
        textTheme: WeedTextThemeDefinition.darkTextTheme,
        iconTheme: _iconThemeData(WeedColors.charcoalBlack),
      );

  static AppBarTheme _appBarTheme(
    Color foregroundColor,
    SystemUiOverlayStyle overlayStyle,
  ) =>
      AppBarTheme(
        centerTitle: false,
        shadowColor: Colors.transparent,
        color: Colors.transparent,
        titleSpacing: 32,
        systemOverlayStyle: overlayStyle,
        elevation: 0,
        titleTextStyle: WeedTextThemeDefinition
            .charcoal.bodyLarge.bold.centerVertical
            .setColor(foregroundColor),
        foregroundColor: foregroundColor,
      );

  static IconThemeData _iconThemeData(Color color) => IconThemeData(
        color: color,
        size: 24,
      );
}
