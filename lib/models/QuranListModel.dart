class QuranListModel {
  QuranListModel({
    this.id,
    this.suratName,
    this.suratText,
    this.suratTerjemahan,
    this.countAyat
  });

  factory QuranListModel.fromJson(Map<String, dynamic> json) => QuranListModel(
    id: json['number'],
    suratName: json['name'],
    suratText: json['englishName'],
    suratTerjemahan: json['englishNameTranslation'],
    countAyat: json['numberOfAyahs'],
  );

  int countAyat;
  int id;
  String suratName;
  String suratTerjemahan;
  String suratText;

  Map<String, dynamic> toJson() => {
    "id": id,
    "suratName": suratName,
    "suratText": suratText,
    "suratTerjemahan": suratTerjemahan,
    "countAyat": countAyat
  };
}
