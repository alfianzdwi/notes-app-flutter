import 'package:belajardasarflutter/bloc/note_bloc.dart';
import 'package:belajardasarflutter/model/note.dart';
import 'package:belajardasarflutter/widget/note_form_widget.dart';
import 'package:belajardasarflutter/widget/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteFormPage extends StatefulWidget {
  final Note? note;


  const NoteFormPage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _NoteFormPageState createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String judul;
  late String isi;
  String createdDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  @override
  void initState() {
    super.initState();

    judul = widget.note?.judul ?? '';
    isi = widget.note?.isi ?? '';
    createdDate = widget.note?.dateTimeCreated ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Note Form',
        style: TextStyle(fontSize: 24),
      ),
    ),
    body: Form(
      key: _formKey,
      child: NoteFormWidget(
        judul: judul,
        isi: isi,
        onChangedJudul: (judul) => setState(() => this.judul = judul),
        onChangedIsi: (isi) => setState(() => this.isi = isi),
      ),
    ),
    floatingActionButton: saveButton(),

  );

  Widget saveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: addOrUpdateNote,
        child: Icon(Icons.save),
      ),
    );
  }

  //Fungsi Untuk Mengecek Kondisi Apakah Update Atau Create
  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.note != null; //Jika Data Tidak Null Atau Kosong Maka Kondisinya Adalah Updating
      if (isUpdating) {
        await updateNote(); //Jika Kondisi Updating Akan Menjalankan Fungsi updateNote()
      } else {
        await addNote(); //Jika Data Note Null Maka Akan Menjalankan Fuungsi addNote()
      }
    }
  }

  //Fungsi Untuk Update Atau Ubah Catatan
  Future updateNote() async {
    final note = Note(
      judul: judul,
      isi: isi,
      id: widget.note!.id,
      dateTimeCreated: '',
    );

     await NoteBloc.updateNote(note: note).then((value) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("Catatan Berhasil Diubah"),
       ));
       //PopUntil : Untuk Mengembalikan Ke Dua Page Sebelumnya Yaitu NotePage(),Karena Jika Menggunakan Push Akan Meniban Page Sebelumnya,Bukan Kembali
       int count = 2;
       Navigator.of(context).popUntil((_) => count-- <= 0);;
       },onError: (error){
       showDialog(
           context: context,
           builder: (BuildContext context) => WarningDialog(
           description: "Gagal mengubah catatan, silahkan coba lagi", okClick: () {  },
           )
       );
       });
  }

  //Fungsi Untuk Create Atau Membuat Catatan
  Future addNote() async {
    final note = Note(
      judul: judul,
      isi: isi,
      id: 0,
      dateTimeCreated: createdDate,
    );

    await NoteBloc.addNote(note: note).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Catatan Berhasil Disimpan"),
      ));
      Navigator.of(context).pop();
    },onError: (error){
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
            description: "Gagal menambahkan catatan, silahkan coba lagi", okClick: () {  },
          )
      );
    });
  }
}