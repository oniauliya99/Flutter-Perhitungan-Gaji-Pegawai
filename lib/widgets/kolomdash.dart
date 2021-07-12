import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle title = GoogleFonts.poppins(); //Mengambil font
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();

class KolomDash extends StatelessWidget {
  const KolomDash({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 40, left: 30),
            child: Text(
              'Hi Admin !!!',
              style: body.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFF003458)),
            )),
        Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            child: Text(
              'Manajemen Pegawai PT. Auliya Oni Priyandika',
              style: body.copyWith(
                  fontSize: 12,
                  color: Color(0xFF003458),
                  fontWeight: FontWeight.bold),
            )),
        Container(
          margin: EdgeInsets.only(top: 20, left: 50),
          width: 310,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2019/09/04/11/48/men-4451373_1280.png'),
                  fit: BoxFit.fill)),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 30, bottom: 10),
          child: Text(
            'Yesterday\'s Summary',
            style: body.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF003458)),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              width: 120,
              height: 200,
              child: Column(
                children: [
                  Card(
                    color: Color(0xFF003458),
                    elevation: 9.0,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Text(
                                'Pegawai AOP',
                                style: but.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'http://smk17cluring.sch.id/wp-content/uploads/2013/06/user.png')),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                '30',
                                style: but.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 200,
              child: Column(
                children: [
                  Card(
                    color: Color(0xFF003458),
                    elevation: 9.0,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Text(
                                'Hari Kerja',
                                style: but.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://cdn.statically.io/img/pngimage.net/wp-content/uploads/2018/05/bekerja-png-7.png')),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                '26',
                                style: but.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 200,
              child: Column(
                children: [
                  Card(
                    color: Color(0xFF003458),
                    elevation: 9.0,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Text(
                                'Hari Libur',
                                style: but.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://png.pngtree.com/png-vector/20190115/ourlarge/pngtree-summer-holidays-background-on-the-beach-with-travel-accessories-png-image_319190.jpg')),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                '4',
                                style: but.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
