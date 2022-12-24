import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:text_editor/src/homepage/homepage.dart';

import 'dart:convert';

import '../common/names.dart';
import '../common/utils.dart';
import 'file_path.dart';

class Settings {
  var username = '';
  var colorThemeName = 'light';
  var language = 'English';
  //TODO: add also here

  Settings({username, colorThemeName, language}); //TODO: add also here

  @override
  String toString() {
    var value = this.toJson();
    return json.encode(value);
  }

  Settings fromString(String string) {
    return Settings.fromJson(json.decode(string));
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'colorThemeName': colorThemeName,
        'language': language,
        //TODO: add also here
      };

  Settings.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        colorThemeName = json['colorThemeName'],
        language = json['language'];
}
