// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:blog_explorer/globalVariables/global_variables.dart';
import 'package:blog_explorer/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Blog>> getBlogs(BuildContext context) async {
  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> blogList = jsonResponse['blogs'];
      return blogList.map((data) => Blog.fromJson(data)).toList();
    } else {
      throw Exception('failed with error');
    }
  } catch (e) {
    showSnackBar(context, e.toString());
    throw Exception(e.toString());
  }
}
