import 'package:flutter/material.dart';
import './home_page.dart';
import './signup_page.dart';

class LoginPage extends StatelessWidget {
  static String tag = 'login-page';
  final _popupMenuList = [
    'about',
    'proxy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: FlutterLogo(size: 20,),
        actions: <Widget>[
          FlatButton(
            color: Colors.transparent,
            textColor: Colors.blue,
            child: Text('Sign up'),
            onPressed: (){
              Navigator.of(context).pushNamed(SignUpPage.tag);
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.blue,),
            itemBuilder: (context)=> _popupMenuList.map((e){
              return PopupMenuItem(
                child: Text(e),
              );
            }).toList(),
          )
        ],
      ),


      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              'Log into Twitter.',
              style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email'
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: (){},
                      ),
                      hintText: 'Password'
                    ),
                  )
                ],
              ),
            ),
          ),
          FlatButton(child: Text('Forgot password?'),onPressed: (){},),
          Expanded(child: Container(),),
          Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            alignment: Alignment.centerRight,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Log in'),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).popAndPushNamed(HomePage.tag);
              },
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
