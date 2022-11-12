import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../login/user.dart';

class LocalStorage {
  Future<String> get _localPath async {
    //final directory = await getApplicationDocumentsDirectory(); // it is persistent
    final directory = await getTemporaryDirectory();  // it is like the chace is not persistent
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/loginUser.json');
  }

  Future<User> readUsers() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return User.fromString(contents);
    } catch (e) {
      print(e);
      return User("", "");
    }
  }

  Future<File> writeUser(User user) async {
    final file = await _localFile;

    print('email: ' + user.email!);
    print('password: ' + user.password!);

    String userstring = user.toString();
    print('Userstring: ' + userstring);

    // Write the file
    return file.writeAsString(userstring, mode: FileMode.write);
    
  }
}
