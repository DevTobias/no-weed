import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';

class WeedTextTheme extends InheritedWidget {
  const WeedTextTheme({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static WeedTextThemeDefinition of(BuildContext context) {
    final WeedTextTheme? result =
        context.dependOnInheritedWidgetOfExactType<WeedTextTheme>();
    assert(result != null, 'No WeedTextThemeDefinition found in context');

    if (Theme.of(context).brightness == Brightness.light) {
      return const WeedTextThemeDefinition(TextColor.charcoal);
    }
    return const WeedTextThemeDefinition(TextColor.warmGrey);
  }

  @override
  bool updateShouldNotify(WeedTextTheme oldWidget) => oldWidget.child != child;
}

class TextColor {
  final Color primaryTextColor;
  final Color black;
  final Color dark;
  final Color medium;
  final Color light;
  final Color extraLight;
  final Color fog;

  const TextColor(
    this.primaryTextColor,
    this.black,
    this.dark,
    this.medium,
    this.light,
    this.extraLight,
    this.fog,
  );

  static const charcoal = TextColor(
    WeedColors.charcoalBlack,
    WeedColors.charcoalBlack,
    WeedColors.charcoalDark,
    WeedColors.charcoalMedium,
    WeedColors.charcoalLight,
    WeedColors.charcoalLight,
    WeedColors.charcoalLight,
  );

  static const warmGrey = TextColor(
    WeedColors.warmGreyFog,
    WeedColors.warmGreyDark,
    WeedColors.warmGreyDark,
    WeedColors.warmGreyMedium,
    WeedColors.warmGreyLight,
    WeedColors.warmGreyExtraLight,
    WeedColors.warmGreyFog,
  );
}

class WeedTextThemeDefinition {
  const WeedTextThemeDefinition(this.colorScheme);

  /// should only be used inside theme definitions
  static WeedTextThemeDefinition get charcoal =>
      const WeedTextThemeDefinition(TextColor.charcoal);

  /// should only be used inside theme definitions
  static WeedTextThemeDefinition get warmGrey =>
      const WeedTextThemeDefinition(TextColor.warmGrey);

  final TextColor colorScheme;

  /// fontSize: 52 fontHeight: 62
  WeedTextStyle get display => WeedTextStyle(_display, colorScheme);

  /// fontSize: 32 fontHeight: 40
  WeedTextStyle get headline1 => WeedTextStyle(_headline1, colorScheme);

  /// fontSize: 24 fontHeight: 32
  WeedTextStyle get headline2 => WeedTextStyle(_headline2, colorScheme);

  /// fontSize: 20 fontHeight: 26
  WeedTextStyle get headline3 => WeedTextStyle(_headline3, colorScheme);

  /// fontSize: 16 fontHeight: 24
  WeedTextStyle get bodyLarge => WeedTextStyle(_bodyLarge, colorScheme);

  /// fontSize: 14 fontHeight: 20
  WeedTextStyle get bodyMedium => WeedTextStyle(_bodyMedium, colorScheme);

  /// fontSize: 12 fontHeight: 20
  WeedTextStyle get bodySmall => WeedTextStyle(_bodySmall, colorScheme);

  /// fontSize: 10 fontHeight: 12
  WeedTextStyle get smallText => WeedTextStyle(_smallText, colorScheme);

  /// fontSize: 16 fontHeight: 20
  WeedTextStyle get labelLarge => WeedTextStyle(_labelLarge, colorScheme);

  /// fontSize: 14 fontHeight: 20
  WeedTextStyle get labelMedium => WeedTextStyle(_labelMedium, colorScheme);

  /// fontSize: 12 fontHeight: 16
  WeedTextStyle get labelSmall => WeedTextStyle(_labelSmall, colorScheme);

  static const _display = TextStyle(
    fontSize: 52,
    height: 62 / 52,
    letterSpacing: 52 * 0.02,
    fontWeight: FontWeight.w400,
  );

  static const _headline1 = TextStyle(
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 32 * 0.02,
    fontWeight: FontWeight.w400,
  );

  static const _headline2 = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: 24 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static const _headline3 = TextStyle(
    fontSize: 20,
    height: 26 / 20,
    letterSpacing: 20 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static const _bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 16 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static const _bodyMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 14 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static const _bodySmall = TextStyle(
    fontSize: 12,
    height: 20 / 12,
    letterSpacing: 12 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static const _smallText = TextStyle(
    fontSize: 10,
    height: 12 / 10,
    letterSpacing: 10 * 0.01,
    fontWeight: FontWeight.w400,
  );

  static const _labelSmall = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 12 * 0.02,
    fontWeight: FontWeight.w400,
  );

  static const _labelMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 14 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static const _labelLarge = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    letterSpacing: 16 * 0.03,
    fontWeight: FontWeight.w400,
  );

  static final darkTextTheme = _textTheme.apply(
    displayColor: WeedColors.warmGreyFog,
  );
  static final lightTextTheme = _textTheme.apply(
    displayColor: WeedColors.charcoalBlack,
  );

  static final _textTheme = TextTheme(
    headline1: _headline1.copyWith(fontWeight: FontWeight.bold),
    headline2: _headline2.copyWith(fontWeight: FontWeight.bold),
    headline3: _headline3.copyWith(fontWeight: FontWeight.bold),
    headline4: _bodyLarge,
    headline5: _bodyMedium,
    bodyText1: _bodySmall,
    bodyText2: _smallText,
    overline: _labelLarge,
    subtitle1: _bodyLarge,
    subtitle2: _labelSmall.copyWith(fontWeight: FontWeight.bold),
  );
}

class WeedTextStyle extends TextStyle {
  const WeedTextStyle._({
    double? fontSize,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    TextLeadingDistribution? leadingDistribution,
    required this.textColor,
  }) : super(
          fontSize: fontSize,
          height: height,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color,
          leadingDistribution: leadingDistribution,
        );

  factory WeedTextStyle(
    TextStyle textStyle,
    TextColor textColor,
  ) =>
      WeedTextStyle._(
        fontSize: textStyle.fontSize,
        height: textStyle.height,
        letterSpacing: textStyle.letterSpacing,
        fontWeight: textStyle.fontWeight,
        color: textColor.primaryTextColor,
        textColor: textColor,
      );

  final TextColor textColor;

  WeedTextStyle get black => _copyWith(color: textColor.black);

  WeedTextStyle get dark => _copyWith(color: textColor.dark);

  WeedTextStyle get medium => _copyWith(color: textColor.medium);

  WeedTextStyle get light => _copyWith(color: textColor.light);

  WeedTextStyle get extraLight => _copyWith(color: textColor.extraLight);

  WeedTextStyle get fog => _copyWith(color: textColor.fog);

  WeedTextStyle get bold => _copyWith(fontWeight: FontWeight.bold);

  WeedTextStyle get thin => _copyWith(fontWeight: FontWeight.w300);

  WeedTextStyle get dense => _copyWith(height: 1);

  WeedTextStyle get centerVertical => _copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      );

  WeedTextStyle get allCaps {
    assert(fontWeight == FontWeight.bold,
        'only font weight bold is supported currently');
    return _copyWith(fontFamily: 'Roboto_Caps');
  }

  WeedTextStyle setColor(Color color) => _copyWith(color: color);

  WeedTextStyle setLineHeight(double lineHeight) =>
      _copyWith(height: lineHeight / fontSize!);

  WeedTextStyle _copyWith({
    Color? color,
    FontWeight? fontWeight,
    double? height,
    String? fontFamily,
    TextLeadingDistribution? leadingDistribution,
  }) =>
      WeedTextStyle._(
        fontSize: fontSize,
        height: height ?? this.height,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        color: color ?? this.color,
        textColor: textColor,
        fontFamily: fontFamily ?? this.fontFamily,
        leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      );
}
