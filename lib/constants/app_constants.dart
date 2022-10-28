import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String titleText = 'Ortalama Hesapla';

  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static const MaterialColor textRenk = Colors.red;

  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w700, color: textRenk);

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w500, color: anaRenk);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 1, vertical: 1);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
