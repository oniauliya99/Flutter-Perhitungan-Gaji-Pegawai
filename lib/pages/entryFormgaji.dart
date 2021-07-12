import 'package:flutter/material.dart';
import 'package:uts/database/db_helper.dart';
import '../models/gaji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

TextStyle title = GoogleFonts.poppins();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();

class EntryFormGaji extends StatefulWidget {
  final Gaji item;

  EntryFormGaji(this.item);

  @override
  EntryFormGajiState createState() => EntryFormGajiState(this.item);
}

class EntryFormGajiState extends State<EntryFormGaji> {
  Gaji item;
  DB_Helper hasil;
  EntryFormGajiState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  TextEditingController gjpController = TextEditingController();
  TextEditingController hkController = TextEditingController();
  TextEditingController tjController = TextEditingController();
  TextEditingController ddController = TextEditingController();
  TextEditingController jhtController = TextEditingController();
  TextEditingController pphController = TextEditingController();
  TextEditingController benefitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF003458),
          centerTitle: true,
          title: new Text('Input Data',
              style: title.copyWith(color: Colors.white)),
        ),
        backgroundColor: Color(0xFFF0F8FF),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 30),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Isi formulir di bawah ini untuk pengisian gaji pegawai di Perusahaan AOP \n\nPerusahaan: \nAOP (Auliya Oni Priyandika)',
                  style: body.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'Nama',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: nameController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 30,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'Nama Pegawai',
                          icon: Icon(Icons.person),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 10),
                      child: Text(
                        'Jabatan',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: jabatanController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 15,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'Jabatan',
                          icon: Icon(Icons.anchor),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'Gaji Pokok',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: gjpController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'Gaji Pokok',
                          icon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 10),
                      child: Text(
                        'Tunjangan Jabatan',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: new TextFormField(
                      controller: hkController,
                      cursorColor: Theme.of(context).cursorColor,
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        labelText: 'Tunjangan Jabatan',
                        icon: Icon(Icons.format_list_numbered),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'Tax Allowance (dikenakan potongan 30 %)',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: tjController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'Tax Allowance',
                          icon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'BPJS Kesehatan (Total Earnings dikurangi total decucation)',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: ddController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'BPJS Kesehatan',
                          icon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'JHT Employee',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: jhtController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'JHT Employee',
                          icon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'PPh21',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: pphController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'PPh21',
                          icon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'AOP Benefit',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: benefitController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'AOP Benefit',
                          icon: Icon(Icons.format_list_numbered),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Color(0xFF003458),
                          textColor: Colors.white,
                          child: Text(
                            'Save',
                            style: body,
                          ),
                          onPressed: () async {
                            if (item == null) {
                              item = Gaji(
                                //memasukkan nilai kedalam model Gaji
                                nameController.text,
                                jabatanController.text,
                                int.parse(gjpController.text),
                                int.parse(hkController.text),
                                int.parse(tjController.text),
                                int.parse(ddController.text),
                                int.parse(jhtController.text),
                                int.parse(pphController.text),
                                int.parse(benefitController.text),
                              );
                            }

                            Navigator.pop(context, item);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                          color: Color(0xFF003458),
                          textColor: Colors.white,
                          child: Text(
                            'Cancel',
                            style: body,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
