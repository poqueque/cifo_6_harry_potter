import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();
  Preferences._internal();

  factory Preferences() => _instance;
  static Preferences get instance => _instance;

  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool getShowSubtitles(){
    return prefs.getBool('showSubtitles') ?? false;
  }

  Future<void> setShowSubtitle(bool value) async {
    await prefs.setBool('showSubtitles', value);
  }

  Future<void> removeShowSubtitles() async{
    await prefs.remove('showSubtitles');
  }

}

