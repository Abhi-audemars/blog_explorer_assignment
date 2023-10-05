import 'package:blog_explorer/blog.dart';
import 'package:blog_explorer/globalVariables/global_variables.dart';
import 'package:blog_explorer/providers/favorites_provider.dart';
import 'package:blog_explorer/screens/blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BlogAdapter());
  boxes = await Hive.openBox<Blog>('blogBox');

  runApp(ChangeNotifierProvider(
      create: (context) => FavoritesProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BlogsScreen(),
    );
  }
}
