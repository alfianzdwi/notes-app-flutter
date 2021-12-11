import 'dart:convert';

import 'package:belajardasarflutter/helper/api.dart';
import 'package:belajardasarflutter/helper/api_url.dart';
import 'package:belajardasarflutter/model/registrasi.dart';


   class RegistrasiBloc{
   static Future<Registrasi> registrasi({required String nama, required String email, required String password})
   async {
   String apiUrl = ApiUrl.registrasi; //Memanggil Route Yang Ada Diclass api_url.dart Di Directory helper

   var body = {
   "nama": nama,
   "email":email,
   "password":password
   };

   var response = await Api().post(apiUrl, body); //Melakukan Request Post,Lalu Hasil Return(Nilai Balik) Disimpan Ke Variabel
   var jsonObj = json.decode(response.body);
   return Registrasi.fromJson(jsonObj);
   }
   }