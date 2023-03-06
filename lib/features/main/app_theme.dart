import 'package:flutter/material.dart';

import '../../shared_components/util/cusmtom_colors.dart';

class AppTheme {
  static ThemeData get getAppTheme {
    //1
    return ThemeData(
        //2

        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        fontFamily: 'Poppins',
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: secondaryColor,
        ),
        cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ));
  }
}
