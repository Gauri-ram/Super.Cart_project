import 'dart:ui';
import 'package:supercart_new/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Outline button style
  static ButtonStyle get outlinePrimaryTL11 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightGreen900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
        shadowColor: theme.colorScheme.primary,
        elevation: 2,
      );
  static ButtonStyle get outlinePrimaryTL16 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightGreen900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
        shadowColor: theme.colorScheme.primary,
        elevation: 4,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
