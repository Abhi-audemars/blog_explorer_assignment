import 'package:blog_explorer/models/blog_model.dart';
import 'package:blog_explorer/repositories/blog_repo.dart';
import 'package:blog_explorer/screens/details_screen.dart';
import 'package:blog_explorer/screens/favorites.dart';
import 'package:flutter/material.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  List<Blog>? blogs = [];

  @override
  void initState() {
    super.initState();
    getBlogs(context).then((fetchedBlogs) {
      setState(() {
        blogs = fetchedBlogs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            'https://lh3.googleusercontent.com/_cqP-YTmrl34lW16ps4w3YeziD4Arb9kzKJngjxjKQtRhPaQ3lPqmGcM9pZdlpzdPhqlB0k=s170',
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritesScreen(),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black12),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border),
              ),
            ),
          ),
        ],
      ),
      body: blogs!.isEmpty || blogs == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: blogs!.length,
              itemBuilder: (context, index) {
                var bl = blogs![index];
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedBlogView(blog: bl),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(31, 176, 176, 176),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                blogs![index].imageUrl,
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogs![index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    const SizedBox(height: 15),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '6th October, 2023',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
