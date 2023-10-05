// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_explorer/providers/favorites_provider.dart';
import 'package:flutter/material.dart';

import 'package:blog_explorer/models/blog_model.dart';
import 'package:provider/provider.dart';

class DetailedBlogView extends StatefulWidget {
  final Blog blog;
  const DetailedBlogView({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  State<DetailedBlogView> createState() => _DetailedBlogViewState();
}

class _DetailedBlogViewState extends State<DetailedBlogView> {
  void toggleFavorite(Blog blog) {
    final blogProvider = Provider.of<FavoritesProvider>(context, listen: false);
    blogProvider.toggleFavoriteStatus(blog);
  }

  @override
  Widget build(BuildContext context) {
    final bp = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                widget.blog.imageUrl,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 22,
                left: 12,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: 22,
                right: 16,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white10),
                  child: IconButton(
                    icon: widget.blog.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      if (widget.blog.isFavorite == true) {
                        bp.removeBlog(widget.blog);
                        toggleFavorite(widget.blog);
                      } else {
                        bp.addBlog(widget.blog);
                        toggleFavorite(widget.blog);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.blog.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '6th October, 2023',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Amidst the bustling cityscape, a hidden garden blooms with vibrant colors and fragrant blossoms, a tranquil oasis in the urban chaos. A lone traveler embarks on a mysterious journey through the pages of an ancient tome, unlocking secrets that defy imagination. In the heart of the forest, a playful squirrel orchestrates a whimsical ballet among the rustling leaves. A midnight sky sprinkled with stars whispers stories of distant galaxies, igniting dreams that stretch beyond the horizon.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
