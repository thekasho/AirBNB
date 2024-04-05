part of 'helpers.dart';

class MyThemApp {
  static ThemeData themeData(BuildContext context) {
    return ThemeData.light().copyWith(
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: GoogleFonts.cairo(
          color: black,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.cairo(
          color: black,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.cairo(
          color: black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.cairo(
          color: black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.cairo(
          color: black,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.cairo(
          color: green,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.cairo(
          color: black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: GoogleFonts.cairo(
          color: black,
          fontSize: 16.sp,
        ),
        bodySmall: GoogleFonts.cairo(
          color: black,
          fontSize: 15.sp,
        ),
        bodyLarge: GoogleFonts.cairo(
          color: black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.cairo(
          color: black,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
