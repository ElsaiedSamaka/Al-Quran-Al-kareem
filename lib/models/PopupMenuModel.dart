import 'package:alquranMobile/constants/Dictionary.dart';
import 'package:alquranMobile/constants/Navigation.dart';

class PopupMenu {
  final String title;
  final String page;

  PopupMenu({ this.title, this.page });

} 

List<PopupMenu> actionList = [
  PopupMenu(
    title: Dictionary.settings,
    page: Navigation.Settings
  ),
  PopupMenu(
    title: Dictionary.about,
    page: Navigation.About
  )
];