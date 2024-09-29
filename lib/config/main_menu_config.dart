import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thinmpf/constant/main_menu_constant.dart';

const List<MainMenuConstant> _defaultSortList = [
  MainMenuConstant.artists,
  MainMenuConstant.albums,
  MainMenuConstant.songs,
  MainMenuConstant.favoriteArtist,
  MainMenuConstant.favoriteSong,
  MainMenuConstant.playlists,
];

const Map<MainMenuConstant, bool> _defaultVisibilityMap = {
  MainMenuConstant.artists: true,
  MainMenuConstant.albums: true,
  MainMenuConstant.songs: true,
  MainMenuConstant.favoriteSong: true,
  MainMenuConstant.favoriteArtist: true,
  MainMenuConstant.playlists: true,
  MainMenuConstant.shortcut: true,
  MainMenuConstant.recent: true,
};

class MainMenuConfig {
  static const String _sortKey = 'sort';
  static const String _visibilityKey = 'visibility';

  Future<List<MainMenuConstant>> loadSort() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_sortKey);

    if (jsonString == null) {
      return _defaultSortList;
    }

    return jsonDecode(jsonString).map<MainMenuConstant>((index) => MainMenuConstant.values[index]).toList();
  }

  Future<void> saveSort(List<MainMenuConstant> list) async {
    final formatted = list.map((item) => item.index).toList();
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(formatted);

    await prefs.setString(_sortKey, jsonString);
  }

  Future<Map<MainMenuConstant, bool>> loadVisibility() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_visibilityKey);

    if (jsonString == null) {
      return _defaultVisibilityMap;
    }

    return jsonDecode(jsonString) as Map<MainMenuConstant, bool>;
  }

  Future<void> saveVisibility(Map<MainMenuConstant, bool> map) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(map);

    await prefs.setString(_visibilityKey, jsonString);
  }
}
