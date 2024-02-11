import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';
import 'package:test_drive/app.dart';
import 'repositories/posts/posts.dart';

void main() {
  final talker = Talker();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  GetIt.I.registerLazySingleton<AbstractPostsRepository>(
      () => PostsRepository(dio: Dio()));
  // GetIt.I.registerLazySingleton(PostsRepository(dio: Dio()));
  // GetIt.I.registerFactory();
  runApp(const App());
}
