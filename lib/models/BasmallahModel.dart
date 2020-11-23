import 'dart:convert';

import 'package:flutter/services.dart';

class Basmallah {
  String ayatArab;
  String ayatTerjemahan;

  Basmallah({this.ayatArab, this.ayatTerjemahan});

  Basmallah.fromJson(Map<String, dynamic> json) {
    ayatArab = json['ayat_arab'];
    ayatTerjemahan = json['ayat_terjemahan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ayat_arab'] = this.ayatArab;
    data['ayat_terjemahan'] = this.ayatTerjemahan;

    return data;
  }
}

Future<String> _loadBasmallahAsset() async {
  return await rootBundle.loadString('lib/jsons/basmallah.json');
}

Future<Basmallah> loadBasmallah() async {
  String jsonString = await _loadBasmallahAsset();
  final jsonResponse = json.decode(jsonString);

  return Basmallah.fromJson(jsonResponse);
}
