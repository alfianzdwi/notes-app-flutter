import 'dart:convert';

 import 'package:belajardasarflutter/helper/api.dart';
 import 'package:belajardasarflutter/helper/api_url.dart';
 import 'package:belajardasarflutter/model/note.dart';

 class NoteBloc {

  static Future<List<Note>> getNotes() async {
      String apiUrl = ApiUrl.listNotes;
      var response = await Api().get(apiUrl);
      var jsonObj = json.decode(response.body);
      List<dynamic> listNote = (jsonObj as Map<String, dynamic>)['data'];
      List<Note> notes = [];
      for(int i=0; i < listNote.length; i++){
      notes.add(Note.fromJson(listNote[i]));
   }
      return notes;
   }


   static Future addNote({ required Note note}) async {
      String apiUrl = ApiUrl.createNotes;

      var body = {
        "judul":note.judul,
        "isi":note.isi,
        "tanggal_dibuat": note.dateTimeCreated
   };

      print("Body Add: $body");
      var response = await Api().post(apiUrl, body);
      var jsonObj = json.decode(response.body);
      return jsonObj['status'];
   }


   static Future<bool> updateNote({required Note note}) async {
      String apiUrl = ApiUrl.updateNotes(note.id);

      var body = {
      "judul": note.judul,
      "isi":note.isi,
      };

      print("Body Update: $body");
      var response = await Api().post(apiUrl, body);
      var jsonObj = json.decode(response.body);
      return jsonObj['data'];
   }

   
   static Future<bool> deleteNote({required Note note}) async {
      String apiUrl = ApiUrl.deleteNotes(note.id);

      var response = await Api().delete(apiUrl);
      var jsonObj = json.decode(response.body);
      return (jsonObj as Map<String, dynamic>)['data'];
  }
}