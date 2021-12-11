
import 'package:belajardasarflutter/ui/login_page.dart';
import 'package:belajardasarflutter/ui/note_page.dart';
import 'package:flutter/material.dart';

import 'helper/user_info.dart';

void main() {
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget { //StatelessWidget adalah class widget yang propertinya immutable, artinya nilainya tidak bisa diubah.
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //MaterialApp adalah widget yang membungkus beberapa widget yang menggunakan tema material design
      title: 'Flutter Dasar',
      home: LoginPage(),//Memanggil Class HeloWorld Yang Sudah Dibuat,Yang Dimana Class Itu Berisi Scafold,Body,Dll.Kita Memisahkannya Agar Kode Lebih Clear
      theme: ThemeData(
        primarySwatch: Colors.blueGrey            ,
      ),

    );
  }
}*/

class MyApp extends StatefulWidget {
   @override
   _MyAppState createState() => _MyAppState();
   }

 class _MyAppState extends State<MyApp> {
   Widget page = CircularProgressIndicator();

   @override
   void initState() {
     super.initState();
     isLogin();
   }

   void isLogin() async {
     var token = await UserInfo().getToken();
     if(token!=null){
       setState(() {
         page = NotePage();
       });
     }else{
       setState(() {
         page = LoginPage();
       });
     }
   }

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Note App',
       debugShowCheckedModeBanner: false,
       home: page,
     );
   }
}
