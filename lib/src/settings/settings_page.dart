import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';


import '../common/names.dart';
import 'file_path.dart';
import 'settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Widget> settings_entries = [];
  Settings settings = Settings();

  late String colorThemeName; // 1: dark 0: light
  late bool colorThemeName_bool;
  late String username;
  late String language;

  @override
  void initState() {
    //LocalStorage loginUserStorage = LocalStorage();
    //await loginUserStorage.writeUser(loginUser);
    _writeSettings(settings);
    Map<String, dynamic> settingsMap = settings.toJson();

    language = settingsMap['language'];
    username = settingsMap['username'];
    colorThemeName = settingsMap['colorThemeName'];
    colorThemeName_bool = colorThemeName == 'light' ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SETTINGS_PAGE_TITLE)),
      body: SettingsList(
        sections: [
          SettingsSection(
            //title: Text('Style'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: Text('English'),
                onPressed: ((context) => _printSettings(context)
              ),),
              SettingsTile.switchTile(
                onToggle: (value) {
                  if (value) {
                    colorThemeName = 'dark';
                    settings.colorThemeName = 'dark';
                  } else {
                    colorThemeName = 'light';
                    settings.colorThemeName = 'light';
                  }
                  setState(() {
                    colorThemeName_bool = value;
                  });
                  _writeSettings(settings);
                },
                initialValue: colorThemeName_bool,
                leading: Icon(Icons.format_paint),
                title: Text('Dark theme'),
              ),
            ],
          ),
        ],
      ),
    );
    //Scaffold(
    //  appBar: AppBar(title: const Text(SETTINGS_PAGE_TITLE)),
    //  body: Column(
    //    children: settings_entries,
    //  ),
    //);
  }
}

Future<void> _printSettings(BuildContext context) async {
  
  LocalStorageSettings localStorage = LocalStorageSettings();
  dynamic _settings = await localStorage.readSettings();
  //print(_settings);
  return;
}

Future<void> _writeSettings(Settings _settings) async {
  
  LocalStorageSettings localStorage = LocalStorageSettings();
  await localStorage.writeSettings(_settings);
  print('writing settings:');
  print(_settings);
  return;
}