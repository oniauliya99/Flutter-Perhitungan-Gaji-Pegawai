class Gaji {
  int _id;
  String _name;
  String _jabatan;
  int _gajiPokok;
  int _hariKerja;
  int _tunjangan;
  int _dedukasi;
  int _jht;
  int _pph;
  int _benefit;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get jabatan => this._jabatan;
  set jabatan(String value) => this._jabatan = value;

  get gajiPokok => this._gajiPokok;
  set gajiPokok(value) => this._gajiPokok = value;

  get hariKerja => this._hariKerja;
  set hariKerja(value) => this._hariKerja = value;

  get tunjangan => this._tunjangan;
  set tunjangan(value) => this._tunjangan = value;

  get dedukasi => this._dedukasi;
  set dedukasi(value) => this._dedukasi = value;

  get jht => this._jht;
  set jht(value) => this._jht = value;

  get pph => this._pph;
  set pph(value) => this._pph = value;

  get benefit => this._benefit;
  set benefit(value) => this._benefit = value;

// konstruktor versi 1
  Gaji(this._name, this._jabatan, this._gajiPokok, this._hariKerja,
      this._tunjangan, this._dedukasi, this._jht, this._pph, this._benefit);
  Gaji.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._jabatan = map['jabatan'];
    this._gajiPokok = map['gajiPokok'];
    this._hariKerja = map['hariKerja'];
    this._tunjangan = map['tunjangan'];
    this._dedukasi = map['dedukasi'];
    this._jht = map['jht'];
    this._pph = map['pph'];
    this._benefit = map['benefit'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['jabatan'] = jabatan;
    map['gajiPokok'] = gajiPokok;
    map['hariKerja'] = hariKerja;
    map['tunjangan'] = tunjangan;
    map['dedukasi'] = dedukasi;
    map['jht'] = jht;
    map['pph'] = pph;
    map['benefit'] = benefit;
    return map;
  }
}
