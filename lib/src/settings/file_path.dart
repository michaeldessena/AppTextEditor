import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:text_editor/src/settings/settings.dart';

class LocalStorageSettings {
  Future<String> get _localPath async {
    //final directory = await getApplicationDocumentsDirectory(); // it is persistent
    final directory = await getTemporaryDirectory();  // it is like the chace is not persistent
    return directory.path;
  }

  /******  SETTINGS  ******/
  Future<File> get _localFileSettings async {
    final path = await _localPath;
    return File('$path/loginSettings.json');
  }

  Future<Settings> readSettings() async {
    try {
      final file = await _localFileSettings;

      // Read the file
      String contents = await file.readAsString();

      print(contents);

      return Settings().fromString(contents);
    } catch (e) {
      print(e);
      return Settings();
    }
  }

  Future<File> writeSettings(Settings settings) async {
    final file = await _localFileSettings;

    String settingsString = settings.toString();

    // Write the file
    return file.writeAsString(settingsString, mode: FileMode.write);
    
  }



}
