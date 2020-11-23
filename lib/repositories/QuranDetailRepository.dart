import 'package:dio/dio.dart';

import 'package:alquranMobile/models/QuranDetailModel.dart';

class QuranDetailRepository {
  var dio = Dio();

  Future<List<QuranDetailModel>> getQuranDetail(String surahId, String ayatCount) async {
    //http://api.alquran.cloud/v1/ayah/{{surahId}}/{{ayatId}}
    String url = 'https://quran.kemenag.go.id/index.php/api/v1/ayatweb/$surahId/0/0/$ayatCount';

    try {
      Response response = await dio.get(url);
      return response.data['data'].map<QuranDetailModel>((json) => QuranDetailModel.fromJson(json)).toList();
    } catch (e) {
      throw e;
    }
  }

}
