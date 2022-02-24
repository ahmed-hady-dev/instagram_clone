import 'package:get_storage/get_storage.dart';

import '../../view/sign_up/model/user_model.dart';

class CacheHelper {
  static final GetStorage _appBox = GetStorage();

  static Future<void> init() async => await GetStorage.init();

//===============================================================

  static Future<void> cacheTheme({required bool? value}) async {
    await _appBox.write('isDark', value);
  }

  static Future<bool?> get getTheme async {
    bool? isDark;
    if (_appBox.hasData('isDark')) {
      isDark = _appBox.read('isDark');
    }
    return isDark;
  }

//===============================================================

  static Future<void> cacheSound({required bool? value}) async {
    await _appBox.write('isSoundOn', value);
  }

  static Future<bool?> get getSound async {
    bool? isSoundOn;
    if (_appBox.hasData('isSoundOn')) {
      isSoundOn = _appBox.read('isSoundOn');
    }
    return isSoundOn;
  }

//===============================================================

  static Future<void> cacheShowCase({required bool? value}) async {
    await _appBox.write('isFirstTime', value);
  }

  static Future<bool?> get getShowCase async {
    bool? isFirstTime;
    if (_appBox.hasData('isFirstTime')) {
      isFirstTime = _appBox.read('isFirstTime');
    }
    return isFirstTime;
  }

  //===============================================================

  static Future<void> cacheUserData({required UserModel userModel}) async =>
      await _cacheUserData(userModel);

  static Future<void> _cacheUserData(UserModel userModel) async =>
      await _appBox.write('user', userModel.toJson());

  static UserModel? get getUserInfo {
    UserModel? userModel;
    if (_appBox.hasData('user')) {
      userModel = UserModel.fromJson(_appBox.read('user'));
    }
    return userModel;
  }

//===============================================================
  static Future<void> write(
      {required String key, required dynamic value}) async {
    return await _appBox.write(key, value);
  }

  static dynamic read({required String key}) {
    return _appBox.read(key);
  }

  static bool hasData({required String key}) {
    return _appBox.hasData(key);
  }
}
