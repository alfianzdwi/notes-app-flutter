import 'package:belajardasarflutter/bloc/registrasi_bloc.dart';
import 'package:belajardasarflutter/widget/success_dialog.dart';
import 'package:belajardasarflutter/widget/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3.5,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: ExactAssetImage('assets/klmpk.jpeg'),
                      fit: BoxFit.fitWidth
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)

                  )
              ),

            ),

            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        ),
                        color: Colors.white,
                        boxShadow: [

                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _namaTextboxController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nama',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _emailTextboxController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _passwordTextboxController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      //Memanggil Class Registrasi Bloc,Dengan Membawa Data Yang Diambil Dari Texfield Untuk Dimasukan Ke Constructor Yang Nantinya Digunakan Untuk Request API Post
                      RegistrasiBloc.registrasi(
                          nama: _namaTextboxController.text,
                          email: _emailTextboxController.text,
                          password: _passwordTextboxController.text
                      ).then((value) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) =>
                                SuccessDialog(
                                  description: "Registrasi berhasil, silahkan login",
                                  okClick: () {
                                    Navigator.pop(context);
                                  },
                                )
                        );
                      }, onError: (error) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) =>
                                WarningDialog(
                                  description: "Registrasi gagal, silahkan coba lagi",
                                  okClick: () {
                                    Navigator.pop(context);
                                  },
                                )
                        );
                      });
                    },

                    child: Container(
                      height: 45,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff75ecdf),
                              Color(0xff21663c),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          )
                      ),
                      child: Center(
                        child: Text('Daftar'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),

            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sudah Punya Akun ?"),
                  Text("Login", style: TextStyle(color: Color(0xff488b5c)),),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

          ],

        ),
      ),
    );
  }



}
