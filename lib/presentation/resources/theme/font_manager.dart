part of 'theme_manager.dart';

TextTheme _textTheme(bool dark) => TextTheme(
      displayLarge: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: dark ? ColorManagerDark.blackColor : ColorManager.blackColor),
      displayMedium: GoogleFonts.alegreyaSans(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: dark ? ColorManagerDark.whiteColor : ColorManager.whiteColor),
      displaySmall: GoogleFonts.alegreyaSans(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: dark ? ColorManagerDark.mainBlue : ColorManager.mainBlue),
      headlineMedium: GoogleFonts.alegreyaSans(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: dark ? ColorManagerDark.mainYellow : ColorManager.mainYellow),
      bodySmall: GoogleFonts.alegreyaSans(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: dark ? ColorManagerDark.whiteColor : ColorManager.whiteColor),
      titleMedium: GoogleFonts.alegreyaSans(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: dark ? ColorManagerDark.whiteColor : ColorManager.whiteColor),
      titleSmall: GoogleFonts.alegreyaSans(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: dark ? ColorManagerDark.mainYellow : ColorManager.mainYellow),
      labelLarge:
          GoogleFonts.alegreyaSans(fontSize: 16, fontWeight: FontWeight.w500),
      labelSmall: GoogleFonts.alegreyaSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: dark ? ColorManagerDark.blackColor : ColorManager.blackColor),
    );
