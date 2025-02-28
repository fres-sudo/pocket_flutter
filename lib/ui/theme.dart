import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:pocket_flutter/ui/colors.dart';
import 'package:pocket_flutter/ui/typography.dart';

class PocketFlutterTheme {
  const PocketFlutterTheme();

  // Made for FlexColorScheme version 7.0.0+.
  // Refer to https://docs.flexcolorscheme.com/ for documentation
  ThemeData get light => _postProcess(FlexThemeData.light(
        colors: _appFlexScheme.light,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        onPrimary: Colors.white,
        scaffoldBackground: PocketFlutterColor.scaffold,
        subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useM2StyleDividerInM3: true,
            defaultRadius: 10,
            drawerBackgroundSchemeColor: SchemeColor.primaryContainer,
            outlinedButtonOutlineSchemeColor: SchemeColor.primary,
            fabSchemeColor: SchemeColor.primary,
            inputDecoratorFillColor: PocketFlutterColor.inputUnfocused),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: PocketFlutterTextStyle.fontFamily,
      ));

  ThemeData get dark => _postProcess(FlexThemeData.dark(
        colors: _appFlexScheme.dark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        onPrimary: Colors.white,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useM2StyleDividerInM3: true,
          defaultRadius: 10,
          drawerBackgroundSchemeColor: SchemeColor.primaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          fabSchemeColor: SchemeColor.primary,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: PocketFlutterTextStyle.fontFamily,
      ));

  // Some tweaks needed after the theme generation
  ThemeData _postProcess(ThemeData theme) => theme.copyWith(
        cardTheme:
            theme.cardTheme.copyWith(color: theme.colorScheme.surface, surfaceTintColor: theme.colorScheme.surface),
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(elevation: 0),
      );
}

const FlexSchemeData _appFlexScheme = FlexSchemeData(
  name: "PocketFlutter",
  description: 'PocketFlutter custom theme',
  light: FlexSchemeColor(
    primary: PocketFlutterColor.primary,
    primaryContainer: PocketFlutterColor.container,
    appBarColor: PocketFlutterColor.container,
    secondary: PocketFlutterColor.secondary,
    secondaryContainer: PocketFlutterColor.container,
  ),
  dark: FlexSchemeColor(
    primary: PocketFlutterColor.primary,
    primaryContainer: PocketFlutterColor.container,
    secondary: PocketFlutterColor.container,
    secondaryContainer: PocketFlutterColor.secondary,
  ),
);
