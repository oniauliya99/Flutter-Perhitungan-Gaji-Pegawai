import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../database/db_helper.dart';
import 'EntryForm.dart';
import '../models/employee.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

TextStyle title = GoogleFonts.lora();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.lora();

//pendukung program asinkron
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DB_Helper dbHelper = DB_Helper();
  int count = 0;
  List<Item> itemList;

  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }

    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF003458),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              var item = await navigateToEntryForm(context, null);
              if (item != null) {
                int result = await dbHelper.insert(item);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          )
        ],
        title: Text(
          'Daftar Pegawai AOP',
          style: body.copyWith(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          width: 310,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2019/09/04/11/48/men-4451373_1280.png'),
                  fit: BoxFit.fill)),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Text(
            'Recent Updates',
            style: but.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF003458)),
          ),
        ),
        Expanded(
          child: createListView(),
        ),
      ]),
    );
  }

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));
    return result;
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          height: 150,
          child: InkWell(
            onLongPress: () async {
              setState(() {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(title: Text('Hapus Data ?'), actions: [
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
                              int result =
                                  await dbHelper.delete(itemList[index].id);
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
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              elevation: 9.0,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://png.pngtree.com/element_our/20190531/ourlarge/pngtree-hard-working-professional-image_1288192.jpg')),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.itemList[index].name,
                      style: body,
                    ),
                    Text(
                      'AOP',
                      style: body.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                            'Nama\t\t\t\t\t\t: ' +
                                this.itemList[index].name +
                                '',
                            style: but.copyWith(fontSize: 12))),
                    Text(
                        'Umur\t\t\t\t\t\t\t: ' +
                            this.itemList[index].umur.toString() +
                            '',
                        style: but.copyWith(fontSize: 12)),
                    Text('Alamat\t\t\t\t: ' + this.itemList[index].alamat + '',
                        style: but.copyWith(fontSize: 12)),
                    Text('Jabatan\t\t\t: ' + this.itemList[index].jabatan + '',
                        style: but.copyWith(fontSize: 12)),
                    Container(
                      margin: EdgeInsets.only(left: 300),
                      child: GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () async {
                          var item = await navigateToEntryForm(
                              context, this.itemList[index]);
                          if (item != null) {
                            editListView(item);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

//update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
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
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

  void editListView(Item object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }
}
