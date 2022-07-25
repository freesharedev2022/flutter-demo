import 'package:flutter/material.dart';
import 'package:helloworld/screens/detailPostScreen.dart';
import 'package:helloworld/models/article.dart';
import 'package:helloworld/components/bottomNav.dart';
import 'package:http/http.dart' as http;
import 'package:helloworld/api/api_list.dart';
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  List<dynamic> _data = [];

  Future<String> getPosts() async {
    final response = await http.get(Uri.parse(APIS.postList), headers: {"Accept": "application/json"});
    var res = jsonDecode(response.body.toString());
    final products = res['products'];
    if(response.statusCode == 200) {
      setState(() {
        _data = products.map((data) => Article.fromJsonMap(data)).toList();
      });
      return "success";
    }
    return "failed";
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false
      ),
      body: ListView.builder(
        itemCount: _data == null ? 0 : _data.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListTile( //use ListTile to show a Todo
              leading: Image.network(
                  _data[index].thumbnail.toString(),
                  width: 120.0,
                  fit: BoxFit.cover
              ),
              title: Text(_data[index].title),
              subtitle: Text(_data[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPostScreen(detail: _data[index]),
                      settings: RouteSettings(
                          arguments: _data[index].id
                      )
                  ),
                );
              },
            )
          );
        },
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
