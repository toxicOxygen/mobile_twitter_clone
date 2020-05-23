import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Twitter Clone',
          style: Theme.of(context).textTheme.headline5.copyWith(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
