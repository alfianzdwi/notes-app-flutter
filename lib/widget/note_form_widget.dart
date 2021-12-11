import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? judul;
  final String? tag;
  final String? isi;

  final ValueChanged<String> onChangedJudul;
  final ValueChanged<String> onChangedIsi;

   NoteFormWidget({
    Key? key,
    this.judul = '',
    this.tag = '',
    this.isi = '',

    required this.onChangedJudul,
    required this.onChangedIsi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildJudul(),
          SizedBox(height: 30),
          buildIsi(),
        ],
      ),
    ),
  );

  Widget buildJudul() => TextFormField(
    maxLines: 1,
    initialValue: judul,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10),
        borderSide: new BorderSide(),
      ),
      hintText: 'Judul',
      hintStyle: TextStyle(color: Colors.grey.shade600),
    ),
    validator: (judul) =>
    judul != null && judul.isEmpty ? 'Judul Tidak Boleh Kosong!!' : null,
    onChanged: onChangedJudul,
  );

  Widget buildIsi() => TextFormField(
    maxLines: 25,
    initialValue: isi,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10),
        borderSide: new BorderSide(),
      ),
      hintText: 'Ketikan Sesuatu...',
      hintStyle: TextStyle(color: Colors.grey.shade600),
    ),
    validator: (isi) => isi != null && isi.isEmpty
        ? 'Isi Catatan Tidak Boleh Kosong!!'
        : null,
    onChanged: onChangedIsi,
  );
}