import 'package:flutter/material.dart';

class FavoritesDataManager {
  static final FavoritesDataManager instance = FavoritesDataManager.internal();
  factory FavoritesDataManager() => instance;
  FavoritesDataManager.internal();

  final List<Widget> _lovedPosts = [];

  List<Widget> get lovedPosts => _lovedPosts;

  void addPost(Widget post) {
    if (!_lovedPosts.contains(post)) {
      _lovedPosts.add(post);
    }
  }

  void removePost(Widget post) {
    _lovedPosts.remove(post);
  }

  void clearFavorites() {
    _lovedPosts.clear();
  }
}
