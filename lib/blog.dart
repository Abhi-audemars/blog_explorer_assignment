// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'blog.g.dart';
@HiveType(typeId: 1)
class Blog {
  @HiveField(0)
  String id;
  @HiveField(1)
  String imageUrl;
  @HiveField(2)
  String title;
  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}
