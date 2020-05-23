import 'package:flutter/material.dart';

class LoadingScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      color: Colors.black12,
    );
  }
}
