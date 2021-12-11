 import 'dart:convert';

 import 'package:belajardasarflutter/helper/api.dart';
 import 'package:belajardasarflutter/helper/api_url.dart';
 import 'package:belajardasarflutter/model/login.dart';

 class LoginBloc{
   static Future<Login> login({required String email, required String password}) async {
     String apiUrl = ApiUrl.login;
     var body = {"email": email, "password": password};
     var response = await Api().post(apiUrl, body);
     var jsonObj = json.decode(response.body);
     return Login.fromJson(jsonObj);
   }
}