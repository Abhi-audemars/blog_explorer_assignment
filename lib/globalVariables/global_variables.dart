import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
const String adminSecret =
    '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.greenAccent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
  );
}

late Box boxes;
