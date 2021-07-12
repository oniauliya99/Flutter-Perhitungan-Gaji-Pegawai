import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/pages/entryFormgaji.dart';
import 'package:uts/pages/homegaji.dart';
import 'dart:async';
import '../database/db_helper.dart';
import '../models/gaji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

TextStyle title = GoogleFonts.lora();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.lora();

//pendukung program asinkron
class Hasilin extends StatefulWidget {
  @override
  HasilinState createState() => HasilinState();
}

class HasilinState extends State<Hasilin> {
  DB_Helper dbHelper = DB_Helper();
  int count = 0;
  List<Gaji> itemList;
  int totalPay = 0;
  int totalEarn = 0;
  int totalDed = 0;

  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Gaji>();
    }
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        title: Text('Riwayat Gaji Pegawai', style: body),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              var item = await navigateToEntryFormgaji(context, null);
              if (item != null) {
                int result = await dbHelper.insertGaji(item);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          )
        ],
        backgroundColor: Color(0xFF003458),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        Expanded(
          child: createListView(),
        ),
      ]),
    );
  }

  Future<Gaji> navigateToEntryFormgaji(BuildContext context, Gaji item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormGaji(item);
    }));
    return result;
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: 220,
              child: InkWell(
                onLongPress: () async {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Hapus Data ?'),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Batal'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() async {
                                      Navigator.pop(context);
                                      int result = await dbHelper
                                          .deleteGaji(itemList[index].id);
                                      delete(result);
                                    });
                                  },
                                  child: Text('Hapus'),
                                ),
                              ]);
                        });
                  });
                },
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.white,
                  elevation: 9.0,
                  child: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(
                                'http://smk17cluring.sch.id/wp-content/uploads/2013/06/user.png')),
                        Container(
                          margin: EdgeInsets.only(bottom: 5, top: 10),
                          child: Text('Gaji Untuk Saudara',
                              style: but.copyWith(
                                  color: Color(0xFF003458),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                                'Nama Pegawai\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : ' +
                                    this.itemList[index].name +
                                    '',
                                style: but.copyWith(fontSize: 12))),
                        Text(
                          'Jabatan\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : ' +
                              this.itemList[index].jabatan,
                          style: but.copyWith(fontSize: 12),
                        ),
                        Text(
                          'Berikut merupakan Gaji Dari Saudara ' +
                              this.itemList[index].name +
                              ' yang menjabat sebagai ' +
                              this.itemList[index].jabatan +
                              ' yang merupakan bagian dari perusahaan kami PT.Auliya Oni Priyandika',
                          style: but.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeGaji(itemList[
                              index]), //menuju halaman HomeGaji untuk melihat detail gaji yang akan dibawa pulang
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

//update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Gaji>> itemListFuture = dbHelper.getGajiList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

  void delete(int id) {
    final Future<int> dbFuture = dbHelper.deleteGaji(id);
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Gaji>> itemListFuture = dbHelper.getGajiList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

  void update() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Gaji>> itemListFuture = dbHelper.getGajiList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
