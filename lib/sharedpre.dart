import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String sharedPreferenceUserenameKey = "USEREMAILKEY";
  static String sharedPreferenceuserLoggedIn = "USERLOGGEDINKEY";
  static String sharedPreferenceUserImageKey = "USERIMAGEKEY";

  //save data

  static Future<bool> saveUsernameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserenameKey, userName);
  }

  static Future<bool> saveUserloggedInSharedPreference(
      bool userLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceuserLoggedIn, userLoggedIn);
  }

  static Future<bool> saveUserImageSharedPreference(String userImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserImageKey, userImage);
  }

//fetch data
  static Future<String> getUsernameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserenameKey);
  }

  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceuserLoggedIn);
  }

  static Future<String> getUserImageSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(
      sharedPreferenceUserImageKey,
    );
  }
}
