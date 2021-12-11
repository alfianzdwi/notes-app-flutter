class Note{
   int id;
   String judul;
   String isi;
   String dateTimeCreated;


   Note({required this.id, required this.judul, required this.isi, required this.dateTimeCreated});
   factory Note.fromJson(Map<String, dynamic> obj) {
     return Note(
     id: obj['id'],
     judul: obj['judul'],
     isi: obj['isi'],
     dateTimeCreated: obj ['dateTimeCreated']
     );
   }

}