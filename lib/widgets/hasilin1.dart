import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/pages/hasilin.dart';

TextStyle title = GoogleFonts.poppins(); //Mengambil font
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();

class FormHasilin1 extends StatelessWidget {
  const FormHasilin1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      width: 90,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        new Hasilin()), //menuju halaman Hasilin untuk melihat gaji
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Color(0xFF003458),
              elevation: 9.0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4aceyzBifYuo8n6t3Y3QIf0SpSZh8L9bijzkw8csdt3454jZugAKwzCiEWwJS1OUiaSA&usqp=CAU')),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Lihat Gaji Pegawai',
                              style: title.copyWith(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60),
                      child: Text(
                        'April, 2021',
                        style: title.copyWith(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
