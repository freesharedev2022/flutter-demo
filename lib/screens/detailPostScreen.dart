import 'package:flutter/material.dart';
import 'package:helloworld/models/article.dart';
import 'package:helloworld/api/api_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DetailPostScreen extends StatefulWidget {
  final Article detail;
  DetailPostScreen({super.key, required this.detail});

  @override
  State<DetailPostScreen> createState() => _DetailPostScreen(detail);
}

class _DetailPostScreen extends State<DetailPostScreen> {
  // Declare a field that holds the Todo

   Article detail;
  _DetailPostScreen(this.detail);

  Future<String> getDetailPosts() async {
    final response = await http.get(Uri.parse(APIS.postList + '/' + detail.id.toString()), headers: {"Accept": "application/json"});
    var res = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      setState(() {
        detail = Article(
            res['id'],
            res['title'],
            res['description'],
            res['price'].toDouble(),
            res['discountPercentage'].toDouble(),
            res['rating'].toDouble(),
            res['stock'],
            res['brand'],
            res['category'],
            res['thumbnail']
        );
      });
      return "success";
    }
    return "failed";
  }


  @override
  void initState() {
    super.initState();
    getDetailPosts();
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${detail.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
                detail.thumbnail.toString(),
                fit: BoxFit.cover
            ),
            Text('${detail.description}'),
            Text('Price: ${detail.price}'),
            Text('DiscountPercentage: ${detail.discountPercentage}'),
            Text('Rating: ${detail.rating}'),
            Text('Stock: ${detail.stock}'),
            Text('Brand: ${detail.brand}'),
            Text('Category: ${detail.category}'),
          ],
        ),
      ),
    );
  }
}