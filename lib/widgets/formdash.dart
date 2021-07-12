import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formhome.dart';
import 'formhome1.dart';
import 'hasilin.dart';
import 'hasilin1.dart';
import 'kolomdash.dart';
import 'package:uts/widgets/kolomdash.dart';

TextStyle title = GoogleFonts.poppins(); //Mengambil font
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();

class FormDash extends StatelessWidget {
  const FormDash({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        KolomDash(),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Text(
            'Your Project',
            style: body.copyWith(
                fontWeight: FontWeight.bold, color: Color(0xFF003458)),
          ),
        ),
        FormHome(),
        FormHome1(),
        FormHasilin(),
        FormHasilin1(),
      ],
    );
  }
}
