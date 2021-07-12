import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/pages/entryFormgaji.dart';
import 'dart:async';
import '../database/db_helper.dart';
import '../models/gaji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

TextStyle title = GoogleFonts.lora();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.lora();

//pendukung program asinkron
class HomeGaji extends StatefulWidget {
  Gaji gajiku;
  HomeGaji(this.gajiku);
  @override
  HomeGajiState createState() => HomeGajiState();
}

class HomeGajiState extends State<HomeGaji> {
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
        backgroundColor: Color(0xFF003458),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text(
              'My Payslips',
              style: but.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 220,
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
                        Container(
                          margin: EdgeInsets.only(bottom: 5, top: 10),
                          child: Text('Earnings',
                              style: but.copyWith(
                                  color: Color(0xFF003458),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                                'Nama Pegawai\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t :  ' +
                                    widget.gajiku.name,
                                style: but.copyWith(fontSize: 12))),
                        Text(
                          'Basic Salary\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : Rp. ' +
                              widget.gajiku.gajiPokok.toString(),
                          style: but.copyWith(fontSize: 12),
                        ),
                        Text(
                          'Tunjangan Jabatan\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : Rp. ' +
                              widget.gajiku.tunjangan.toString(),
                          style: but.copyWith(fontSize: 12),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                              'Tax Allowance\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: Rp. ' +
                                  widget.gajiku.hariKerja.toString(),
                              style: but.copyWith(fontSize: 12)),
                        ),
                        Container(
                          height: 30,
                          width: 450,
                          color: Colors.blueGrey[50],
                          child: Text(
                            'Total Earnings\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: Rp. ' +
                                (totalEarn = widget.gajiku.tunjangan +
                                        widget.gajiku.hariKerja +
                                        widget.gajiku.gajiPokok)
                                    .toString(), //penambahan total earnings
                            style: but.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                height: 250,
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
                        Container(
                          margin: EdgeInsets.only(bottom: 5, top: 10),
                          child: Text('Deducations',
                              style: but.copyWith(
                                  color: Color(0xFF003458),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                                'BPJS Kesehatan\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : Rp. -' +
                                    widget.gajiku.dedukasi.toString(),
                                style: but.copyWith(fontSize: 12))),
                        Text(
                          'JHT Employee\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : Rp. -' +
                              widget.gajiku.jht.toString(),
                          style: but.copyWith(fontSize: 12),
                        ),
                        Text(
                          'PPh21\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t : Rp. -' +
                              widget.gajiku.pph.toString(),
                          style: but.copyWith(fontSize: 12),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5, top: 10),
                          child: Text('Additional Deducations',
                              style: but.copyWith(
                                  color: Color(0xFF003458),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                              'AOP Benefit\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: Rp. -' +
                                  widget.gajiku.benefit.toString(),
                              style: but.copyWith(fontSize: 12)),
                        ),
                        Container(
                          height: 30,
                          width: 450,
                          color: Colors.blueGrey[50],
                          child: Text(
                            'Total Deducations\t\t\t\t\t\t\t\t\t\t\t: Rp. -' +
                                (totalDed = widget.gajiku.jht +
                                        widget.gajiku.dedukasi +
                                        widget.gajiku.pph +
                                        widget.gajiku.benefit)
                                    .toString(), //penambahan total deducation
                            style: but.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text('Take Home Pay',
                    style: but.copyWith(
                        color: Color(0xFF003458),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                child: Text(
                  'Rp. ' +
                      (totalPay = totalEarn - totalDed)
                          .toString(), //total earning-total deducation
                  style: but.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
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
    final Future<int> dbFuture = dbHelper.delete(id);
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
