import 'package:alquranMobile/utils/Colors.dart';
import 'package:flutter/material.dart';

import 'package:alquranMobile/constants/Dictionary.dart';

class BottomSheetItem {
  final String key;
  final Text title;
  final Icon icon;

  BottomSheetItem({
    this.key,
    this.title,
    this.icon
  });
}

List<BottomSheetItem> bottomSheetLists = [
  BottomSheetItem(
    key: 'play',
    title: Text(Dictionary.playSurah),
    icon: Icon(Icons.play_arrow, color: ColorBase.black),
  ),
  BottomSheetItem(
    key: 'tafsir',
    title: Text(Dictionary.showTafsir),
    icon: Icon(Icons.book, color: ColorBase.black),
  ),
  BottomSheetItem(
    key: 'copy',
    title: Text(Dictionary.copyAyat),
    icon: Icon(Icons.content_copy, color: ColorBase.black),
  ),
  BottomSheetItem(
    key: 'share',
    title: Text(Dictionary.shareAyat),
    icon: Icon(Icons.share, color: ColorBase.black),
  )
];