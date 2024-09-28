import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum MainMenuItemConstant {
  artists,
  albums,
  songs,
  favoriteSong,
  favoriteArtist,
  playlists,
  shortcut,
  recent,
}

const List<MainMenuItemConstant> _defaultSortList = [
  MainMenuItemConstant.artists,
  MainMenuItemConstant.albums,
  MainMenuItemConstant.songs,
  MainMenuItemConstant.favoriteArtist,
  MainMenuItemConstant.favoriteSong,
  MainMenuItemConstant.playlists,
];

const Map<MainMenuItemConstant, bool> _defaultVisibilityMap = {
  MainMenuItemConstant.artists: true,
  MainMenuItemConstant.albums: true,
  MainMenuItemConstant.songs: true,
  MainMenuItemConstant.favoriteSong: true,
  MainMenuItemConstant.favoriteArtist: true,
  MainMenuItemConstant.playlists: true,
  MainMenuItemConstant.shortcut: true,
  MainMenuItemConstant.recent: true,
};

class MainMenuConfig {
  static const String _sortKey = 'sort';
  static const String _visibilityKey = 'visibility';

  Future<List<MainMenuItemConstant>> loadSort() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_sortKey);

    if (jsonString == null) {
      return _defaultSortList;
    }

    return jsonDecode(jsonString) as List<MainMenuItemConstant>;
  }

  Future<void> saveSort(List<MainMenuItemConstant> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(list);

    await prefs.setString(_sortKey, jsonString);
  }

  Future<Map<MainMenuItemConstant, bool>> loadVisibility() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_visibilityKey);

    if (jsonString == null) {
      return _defaultVisibilityMap;
    }

    return jsonDecode(jsonString) as Map<MainMenuItemConstant, bool>;
  }

  Future<void> saveVisibility(Map<MainMenuItemConstant, bool> map) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(map);

    await prefs.setString(_visibilityKey, jsonString);
  }
}
