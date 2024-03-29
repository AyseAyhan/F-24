import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_info.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const String newImagePath =
      'https://www.careerfaqs.com.au/wp-content/uploads/2018/10/Perfect_LinkedIn_Photo.jpg';

  static const myUser = User(
      imagePath: newImagePath,
      firstname: 'Name',
      lastname: 'Lastname',
      email: 'email@gmail.com',
      about: 'Kendin hakkında biraz yaz. Hedeflerin neler? Kariyer hedefleriniz ve hobi hedefleriniz var mı? Neyi başarmak istiyorsun? İlgi alanlarınız vb.',      phone: '(012)345-678');

  static const _keyDarkMode = 'darkMode';

  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }

  static void setDarkModeEnabled(bool value) {
    _preferences.setBool(_keyDarkMode, value);
  }

  static bool isDarkModeEnabled() {
    return _preferences.getBool(_keyDarkMode) ?? false;
  }
}