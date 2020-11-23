import 'package:flutter/material.dart';
import 'package:alquranMobile/utils/Colors.dart';
import 'package:alquranMobile/components/Appbar.dart';
import 'package:alquranMobile/constants/Dictionary.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Dictionary.about,
      ),
      body: Container(
        color: ColorBase.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/ic_icon.png', height: 70, width: 70),
              SizedBox(height: 10),
              Text(
                Dictionary.appName,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Version 1.0',
                style: TextStyle(
                  fontSize: 14.0,
                  color: ColorBase.slateGray
                ),
              ),
              SizedBox(height: 5),
              Text(
                '© Saied Samaka',
                style: TextStyle(
                  fontSize: 14.0,
                  color: ColorBase.slateGray
                ),
              )
            ],
          )
        )
      ),
    );
  }
}
