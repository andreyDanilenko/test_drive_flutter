import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_drive/app.dart';
import 'repositories/posts/posts.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractPostsRepository>(
      () => PostsRepository(dio: Dio()));
  // GetIt.I.registerLazySingleton(PostsRepository(dio: Dio()));
  // GetIt.I.registerFactory();
  runApp(const App());
}
