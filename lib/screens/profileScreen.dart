import 'package:flutter/material.dart';
import 'package:helloworld/components/bottomNav.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key ? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{
      print("email: " + email);
      print("password: "+password);
      Response response = await post(
          Uri.parse('https://reqres.in/api/login'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline3,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  login(emailController.text.toString(), passwordController.text.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),
                child: const Text('LOGIN'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}