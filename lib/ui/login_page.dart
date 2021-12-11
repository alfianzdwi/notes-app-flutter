import 'package:belajardasarflutter/bloc/login_bloc.dart';
import 'package:belajardasarflutter/helper/user_info.dart';
import 'package:belajardasarflutter/ui/register_page.dart';
import 'package:belajardasarflutter/widget/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'note_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

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
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.5,
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
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 82),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 45,
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
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
                      icon: Icon(Icons.person,
                        color: Color(0xff04090c),
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 45,
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
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
                    obscureText: true,
                    controller: _passwordTextboxController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.vpn_key,
                        color: Color(0xff080d10),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),


                SizedBox(
                  height: 70,
                ),

                InkWell(
                  onTap: (){
                    LoginBloc.login(
                        email: _emailTextboxController.text,
                        password: _passwordTextboxController.text
                    ).then((value) async{
                      await UserInfo().setToken(value.token);
                      await UserInfo().setUserID(value.userID);
                      Navigator.pushReplacement(
                          context, new MaterialPageRoute(builder: (context) => NotePage()));
                    }, onError: (error){
                      print(error);
                      showDialog(
                          context: context,

                          barrierDismissible: false,
                          builder: (BuildContext context) => WarningDialog(
                            description: "Login gagal, silahkan coba lagi", okClick: () {  },
                          )
                      );
                    });
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width/1.2,
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
                      child: Text('Login'.toUpperCase(),
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
                Text("Belum Punya Akun ?"),
                Text("Daftar",style: TextStyle(color: Color(0xff488b5c)),),
              ],
            ),
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => RegisterPage()));
            },
          ),
        ],

      ),
    );
  }

}