import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

// colors
const Color kRichBlack
= Color.fromARGB(255, 4, 19, 43);
const Color kOxfordBlue
= Color.fromARGB(255, 0, 43, 90);
const Color kPrussianBlue
= Color.fromARGB(255, 24, 40, 55);
const Color kMikadoYellow
= Color.fromARGB(233, 248, 237, 153);
const Color kDavysGrey
= Color.fromARGB(255, 19, 21, 21);
const Color kGrey
= Color(0xFF303030);

// text style
final TextStyle kHeading5 =
    GoogleFonts.poppins
      (fontSize: 23, fontWeight: FontWeight.w400);

final TextStyle kHeading6 = GoogleFonts.poppins
  (fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);

final TextStyle kSubtitle = GoogleFonts.poppins
  (fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);

final TextStyle kBodyText = GoogleFonts.poppins
  (fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headline5:
  kHeading5,

  headline6:
  kHeading6,

  subtitle1:
  kSubtitle,

  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary:
  kMikadoYellow,

  primaryContainer:
  kMikadoYellow,

  secondary:
  kPrussianBlue,

  secondaryContainer:
  kPrussianBlue,

  surface:
  kRichBlack,

  background:
  kRichBlack,

  error:
  Colors.red,

  onPrimary:
  kRichBlack,

  onSecondary:
  Colors.white,

  onSurface:
  Colors.white,

  onBackground:
  Colors.white,

  onError:
  Colors.white,

  brightness:
  Brightness.dark,
);
