import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_drive/app.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'repositories/posts/posts.dart';

void main() {
  getContainers();
  runApp(const App());
}

void getContainers() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  GetIt.I.registerLazySingleton<AbstractPostsRepository>(
      () => PostsRepository(dio: Dio()));
}
