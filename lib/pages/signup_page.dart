import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String tag = 'sign-up-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: FlutterLogo(size: 20,),
        iconTheme: IconThemeData(color: Colors.blue),
      ),

      body: Column(
        children: <Widget>[

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              'Create your account',
              style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Expanded(child: Container(),flex: 2,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: UnderlineInputBorder(),
                    ),
                    maxLength: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: UnderlineInputBorder()
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: UnderlineInputBorder()
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: UnderlineInputBorder()
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container(),flex: 3,),
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
              child: Text('Create Account'),
              onPressed: (){},
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
