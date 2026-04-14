import 'package:flutter/material.dart';
import 'package:tp2/repository/settingrepository.dart';

class SettingViewModel extends ChangeNotifier {
  bool _isDark = false;
  final SettingRepository _settingRepository = SettingRepository();

  bool get isDark => _isDark;

  SettingViewModel() {
    getSettings();
  }

  set isDark(bool value) {
    _isDark = value;
    _settingRepository.saveSettings(value);
    notifyListeners();
  }

  Future<void> getSettings() async {
    _isDark = await _settingRepository.getSettings();
    notifyListeners();
  }
}
