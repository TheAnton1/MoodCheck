import 'package:flutter/material.dart';

ThemeData getTheme()=>
    ThemeData(
      primarySwatch: Colors.orange,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(76, 76, 105, 1),
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
