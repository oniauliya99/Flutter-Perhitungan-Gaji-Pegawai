import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/pages/home.dart';

TextStyle title = GoogleFonts.poppins(); //Mengambil font
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();

class FormHome extends StatelessWidget {
  const FormHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      width: 90,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new Home()),
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
                                  'https://www.shareicon.net/data/2015/03/29/14537_add_256x256.png')),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Tambah Data Pegawai',
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
