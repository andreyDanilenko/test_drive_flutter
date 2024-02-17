import 'package:test_drive/features/post_screen/post.dart';
import 'package:test_drive/features/posts_screen/posts.dart';
import 'package:test_drive/features/crypto_list_screen/crypto_list.dart';
import 'package:test_drive/features/home_screen/home.dart';

final routes = {
  '/': (context) => const HomeScreen(),
  '/posts': (context) => const PostsScreen(),
  '/detail-post': (context) => const PostScreen(),
  '/crypto-coins': (context) => const CryptoListScreen(),
  '/detail-crypto-coin': (context) => const PostScreen()
};
