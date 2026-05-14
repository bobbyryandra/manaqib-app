import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {
  List<int> _bookmarkedIds = [];

  List<int> get bookmarkedIds => List.unmodifiable(_bookmarkedIds);

  bool isBookmarked(int id) => _bookmarkedIds.contains(id);

  int get count => _bookmarkedIds.length;

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('bookmarks');
    if (saved != null) {
      final List<dynamic> decoded = jsonDecode(saved);
      _bookmarkedIds = decoded.cast<int>();
      notifyListeners();
    }
  }

  Future<void> toggleBookmark(int id) async {
    if (_bookmarkedIds.contains(id)) {
      _bookmarkedIds.remove(id);
    } else {
      _bookmarkedIds.add(id);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookmarks', jsonEncode(_bookmarkedIds));
    notifyListeners();
  }

  Future<void> removeBookmark(int id) async {
    _bookmarkedIds.remove(id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookmarks', jsonEncode(_bookmarkedIds));
    notifyListeners();
  }

  Future<void> clearAll() async {
    _bookmarkedIds.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('bookmarks');
    notifyListeners();
  }
}
