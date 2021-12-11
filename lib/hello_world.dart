

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelloWorld extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(//Scaffold adalah widget untuk struktur dasar material design.Scaffold adalah kelas dalam flutter yang menyediakan banyak widget atau kita dapat mengatakan API seperti Drawer, SnackBar, BottomNavigationBar, FloatingActionButton, AppBar dll. Scaffold akan memperluas atau menempati seluruh layar perangkat. Ini akan menempati ruang yang tersedia.;
      appBar: AppBar( //AppBar adalah widget untuk membuat AppBar/ActionBar;
        title: Text('Belajar Basic Flutter'), //Text() untuk membuat teks;
      ),
      body: Center(
        child: Text('Halo Bangsat'),
      ),
    );
  }
}