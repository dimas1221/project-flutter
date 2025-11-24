import 'package:flutter/material.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/usecases/get_posts_usecase.dart';

class PostController extends ChangeNotifier {
  final GetPostsUsecase getPosts;

  PostController(this.getPosts);

  bool loading = false;
  List<PostEntity> posts = [];
  String? error; // <-- DITAMBAHKAN

  Future<void> fetchPosts() async {
    loading = true;
    error = null; // reset error
    notifyListeners();

    try {
      posts = await getPosts();
    } catch (e) {
      error = e.toString(); // simpan error
    }

    loading = false;
    notifyListeners();
  }
}
