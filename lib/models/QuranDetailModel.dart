class QuranDetailModel {
  int ayaId;
  int ayaNumber;
  String ayaText;
  int suraId;
  int juzId;
  int pageNumber;
  String translationAyaText;

  QuranDetailModel({
    this.ayaId,
    this.ayaNumber,
    this.ayaText,
    this.suraId,
    this.juzId,
    this.pageNumber,
    this.translationAyaText
  });

  factory QuranDetailModel.fromJson(Map<String, dynamic> json) => QuranDetailModel(
    ayaId: json['aya_id'],
    ayaNumber: json['aya_number'],
    ayaText: json['aya_text'],
    suraId: json['sura_id'],
    juzId: json['juz_id'],
    pageNumber: json['page_number'],
    translationAyaText: json['translation_aya_text'],
  );

  Map<String, dynamic> toJson() => {
    "aya_id": ayaId,
    "aya_number": ayaNumber,
    "aya_text": ayaText,
    "sura_id": suraId,
    "juz_id": juzId,
    "page_number": pageNumber,
    "translation_aya_text": translationAyaText,
  };
}
