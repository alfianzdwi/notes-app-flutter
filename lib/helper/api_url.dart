class ApiUrl {
   static const String baseUrl = 'http://10.0.2.2/notesapp/public';

   static const String registrasi = baseUrl + '/register'; //Route Untuk Request API Untuk Registrasi
   static const String login = baseUrl + '/login'; //Route Untuk Request API Unruk Login
   static const String listNotes = baseUrl + '/notes'; //Route Untuk Request API Untuk Menampilkan Semua Catatan
   static const String createNotes = baseUrl + '/notes'; //Route Untuk Request API Untuk Membuuat Catatan

   //Route Untuk Mengubah Catatan
   static String updateNotes(int id) {
      return baseUrl + '/notes/' + id.toString() + '/update';
   }

   //Route Untuk Menampilkan Catatan Berdasarkan Id
   static String showNotes(int id) {
      return baseUrl + '/notes/' + id.toString();
   }

   //Route Untuk Menghapus Catatan
   static String deleteNotes(int id) {
      return baseUrl + '/notes/' + id.toString();
   }
}