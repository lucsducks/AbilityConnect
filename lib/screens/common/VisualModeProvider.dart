import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum VisualMode { normal, highContrast, colorBlind }

class VisualModeProvider with ChangeNotifier {
  VisualMode _mode = VisualMode.normal;

  VisualMode get mode => _mode;

  VisualModeProvider() {
    _loadVisualMode();
  }

  Future<void> _loadVisualMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMode = prefs.getInt('visualMode') ?? VisualMode.normal.index;
    _mode = VisualMode.values[savedMode];
    notifyListeners();
  }

  Future<void> setVisualMode(VisualMode mode) async {
    _mode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('visualMode', mode.index);
  }
}
