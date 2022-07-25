import 'package:flutter/material.dart';
import 'package:helloworld/models/article.dart';
import 'package:helloworld/api/api_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:helloworld/components/reusbaleRow.dart';

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
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: Text(
                    '${detail.description}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
            ),
            ReusbaleRow(title: 'Price', value: detail.price.toString() + " dolar"),
            ReusbaleRow(title: 'DiscountPercentage', value: detail.discountPercentage.toString() + ' %'),
            ReusbaleRow(title: 'Rating', value: detail.rating.toString() + ' star'),
            ReusbaleRow(title: 'Stock', value: detail.stock.toString()),
            ReusbaleRow(title: 'Brand', value: detail.brand.toString()),
            ReusbaleRow(title: 'Category', value: detail.category.toString())
          ],
        ),
      ),
    );
  }
}