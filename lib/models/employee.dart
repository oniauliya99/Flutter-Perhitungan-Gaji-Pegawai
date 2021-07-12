class Item {
  int _id;
  String _name;
  int _umur;
  String _alamat;
  String _jabatan;
  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  get umur => this._umur;
  set umur(value) => this._umur = value;

  String get alamat => this._alamat;
  set alamat(String value) => this._alamat = value;

  String get jabatan => this._jabatan;
  set jabatan(value) => this._jabatan = value;

// konstruktor versi 1
  Item(this._name, this._umur, this._alamat, this._jabatan);
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._umur = map['umur'];
    this._alamat = map['alamat'];
    this._jabatan = map['jabatan'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['umur'] = umur;
    map['alamat'] = alamat;
    map['jabatan'] = jabatan;
    return map;
  }
}
