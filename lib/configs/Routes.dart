import 'package:flutter/material.dart';

import 'package:alquranMobile/screens/about.dart';
import 'package:alquranMobile/screens/splash.dart';
import 'package:alquranMobile/screens/settings.dart';
import 'package:alquranMobile/screens/quran_list.dart';
import 'package:alquranMobile/constants/Navigation.dart';
import 'package:alquranMobile/screens/quran_detail.dart';

Route generateRoutes(RouteSettings settings) {

  final args = settings.arguments;

  switch (settings.name) {
    case Navigation.Splash:
      return buildRoute(settings, SplashPage());
    case Navigation.Settings:
      return buildRoute(settings, SettingsPage());
    case Navigation.About:
      return buildRoute(settings, AboutPage());
    case Navigation.QuranList:
      return buildRoute(settings, QuranListPage());
    case Navigation.QuranDetail:
      return buildRoute(settings, QuranDetail(dataSurah: args));
    default:
      return null;
  }
  
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}