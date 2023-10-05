import 'package:blog_explorer/models/blog_model.dart';
import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
 final List<Blog> _blogs = [];

  List<Blog> get blogs => _blogs;

  void addBlog(Blog blog) {
    _blogs.add(blog);
    notifyListeners();
  }

  void removeBlog(Blog blog) {
    _blogs.remove(blog);
    notifyListeners();
  }

  void toggleFavoriteStatus(Blog blog) {
    final index = _blogs.indexWhere((b) => b.id == blog.id);
    if (index != -1) {
      _blogs[index].isFavorite = !_blogs[index].isFavorite;
      notifyListeners();
    }
  }
}
