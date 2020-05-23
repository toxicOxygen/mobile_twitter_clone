import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/providers/auth_providers.dart';
import './home_page.dart';
import '../custom_widgets/loading_widget.dart';
import './signup_page.dart';
import '../extras/validators.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _authData = {'email':'','password':'','username':''};
  final _popupMenuList = [
    'about',
    'proxy'
  ];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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


      body: Stack(
        children: <Widget>[
          Column(
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
                  key: _formKey,
                  autovalidate: false,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email'
                        ),
                        onSaved: (val)=>_authData['email'] = val,
                        validator: (val)=> isEmailValid(val),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Username',
                        ),
                        onSaved: (val)=> _authData['username'] = val,
                        validator: (val)=> isUsernameValid(val),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Password'
                        ),
                        onSaved: (val)=>_authData['password'] = val,
                        validator: (val)=> isPasswordValid(val),
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
                  onPressed: ()=>_login(context),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
          if(_isLoading)
            LoadingScreenWidget(),
        ],
      ),
    );
  }

  void _login(BuildContext context){
    if(!_formKey.currentState.validate())
      return;
    _formKey.currentState.save();
    setState(() { _isLoading = true; });
    final AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: false);
    authProvider.login(
      _authData['email'],
      _authData['username'],
      _authData['password']
    ).then((value){
      setState(() {_isLoading = false; });
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed(HomePage.tag);
    }).catchError((e){
      setState(() {_isLoading = false; });
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Login failed, check credentials and try again'),
        duration: Duration(milliseconds: 1500),
      ));
    });
  }
}
