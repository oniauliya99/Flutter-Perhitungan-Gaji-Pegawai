import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/database/db_helper.dart';
import 'package:uts/models/gaji.dart';
import 'package:uts/pages/dash.dart';
import 'dart:ui';

TextStyle title = GoogleFonts.poppins();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();
DB_Helper hasil;
Gaji item;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Dash(), //memanggil Class Dash
    );
  }
}
