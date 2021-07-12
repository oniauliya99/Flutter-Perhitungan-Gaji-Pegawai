import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

TextStyle title = GoogleFonts.poppins();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.roboto();

class EntryForm extends StatefulWidget {
  final Item item;

  EntryForm(this.item);

  @override
  EntryFormState createState() => EntryFormState(this.item);
}

class EntryFormState extends State<EntryForm> {
  Item item;

  EntryFormState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (item != null) {
      nameController.text = item.name;
      umurController.text = item.umur.toString();
      alamatController.text = item.alamat;
      jabatanController.text = item.jabatan;
    }
    return Scaffold(
        backgroundColor: Color(0xFFF0F8FF),
        appBar: new AppBar(
          backgroundColor: Color(0xFF003458),
          centerTitle: true,
          title: new Text('Input Data',
              style: title.copyWith(color: Colors.white)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 30),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Isi formulir di bawah ini untuk pengisian gaji pegawai di Perusahaan JTI \n\nPerusahaan: \nJTI (Jurusan Teknologi Informasi)',
                  style: body.copyWith(
                      color: Color(0xFF003458), fontWeight: FontWeight.bold),
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
                          fillColor: Color(0xFF003458),
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
                      margin: EdgeInsets.only(left: 55, bottom: 5),
                      child: Text(
                        'Umur',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: Container(
                      height: 70,
                      child: new TextFormField(
                        controller: umurController,
                        cursorColor: Theme.of(context).cursorColor,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF003458),
                          labelText: 'Umur Pegawai',
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
                        'Alamat',
                        style: body.copyWith(color: Colors.black),
                      )),
                  new ListTile(
                    title: new TextFormField(
                      controller: alamatController,
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 50,
                      decoration: InputDecoration(
                        fillColor: Color(0xFF003458),
                        labelText: 'Alamat',
                        icon: Icon(Icons.home_filled),
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
                          fillColor: Color(0xFF003458),
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
                          onPressed: () {
                            if (item == null) {
                              //memasukkan nilai kedalam model Item
                              item = Item(
                                  nameController.text,
                                  int.parse(umurController.text),
                                  alamatController.text,
                                  jabatanController.text);
                            } else {
                              //untuk edit data jika model Item terdapat value
                              item = Item(
                                  item.name = nameController.text,
                                  item.umur = int.parse(umurController.text),
                                  item.alamat = alamatController.text,
                                  item.jabatan = jabatanController.text);
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
