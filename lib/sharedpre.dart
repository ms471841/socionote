import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String sharedPreferenceUserenameKey = "USEREMAILKEY";
  static String sharedPreferenceuserLoggedIn = "USERLOGGEDINKEY";
  static String sharedPreferenceUserImageKey = "USERIMAGEKEY";
  static Future<bool> saveUsernameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserenameKey, userName);
  }

  static Future<String> getUsernameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserenameKey);
  }

  static Future<bool> saveUserloggedInSharedPreference(
      bool userLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserenameKey, userLoggedIn);
  }

  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceuserLoggedIn);
  }

  static Future<bool> saveUserImageSharedPreference(String userImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserImageKey, userImage);
  }

  static Future<String> getUserImageSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(
      sharedPreferenceUserImageKey,
    );
  }
}
