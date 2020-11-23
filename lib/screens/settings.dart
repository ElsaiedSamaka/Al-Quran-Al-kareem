import 'package:flutter/material.dart';
import 'package:alquranMobile/components/Appbar.dart';
import 'package:alquranMobile/utils/Colors.dart';
import 'package:alquranMobile/constants/Dictionary.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.white,
      appBar: CustomAppBar(
        title: Dictionary.settings,
      ),
      body: Column(
        children: [
          _buildGenaralSettings(),
          _buildOtherSettings(),
        ],
      ),
    );
  }

  Widget _buildGenaralSettings() {
    return (
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              Dictionary.generalSettings, 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorBase.persianGreen
              ),
            )
          ),
          ListTile(
            title: Text(Dictionary.fontTypeArabic),
            subtitle: Text('خط النسخ'),
            onTap: () {},
          ),
          ListTile(
            title: Text(Dictionary.appLanguage),
            subtitle: Text('English'),
            onTap: () {},
          ),
          ListTile(
            title: Text(Dictionary.darkMode),
            subtitle: Text(Dictionary.darkModeOff),
            trailing: Switch(
              activeColor: ColorBase.persianGreen,
              value: _checked,
              onChanged: (newValue) {
                setState(() {
                  _checked = newValue;
                });
              },
            ),
            onTap: () {},
          ),
        ],
      )
    );
  }

  Widget _buildOtherSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            Dictionary.otherSettings, 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorBase.persianGreen
            ),
          )
        ),
        ListTile(
          title: Text(Dictionary.help),
          subtitle: Text(Dictionary.needHelpTitle),
          onTap: () {},
        ),
        ListTile(
          title: Text(Dictionary.appVersion),
          subtitle: Text('1.0'),
          onTap: () {},
        ),
      ],
    );
  }
}
