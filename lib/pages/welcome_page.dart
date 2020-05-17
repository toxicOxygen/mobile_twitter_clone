import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './signup_page.dart';
import './login_page.dart';

class WelcomePage extends StatelessWidget {
  static String tag = 'welcome-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: FlutterLogo(size: 20,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text(
                "See what's happening in\nthe world right now.",
                style: Theme.of(context).textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
            ),
            SizedBox(height: 25,),
            RaisedButton(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              color: Colors.blue,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Create account',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white
                    ),
                  )
                ],
              ),
              onPressed: (){
                Navigator.of(context).pushNamed(SignUpPage.tag);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 30.0,
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: 'Have an account already? '),
              TextSpan(
                text: 'Log in',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = ()=>
                    Navigator.of(context).pushNamed(LoginPage.tag)
              )
            ]
          ),
        ),
      ),
    );
  }

}
