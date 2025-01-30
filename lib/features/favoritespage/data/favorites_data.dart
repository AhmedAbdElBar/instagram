import 'package:flutter/material.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';

class FavoritesDataManager {
  static final FavoritesDataManager _instance = FavoritesDataManager._internal();
  factory FavoritesDataManager() => _instance;
  FavoritesDataManager._internal();

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
