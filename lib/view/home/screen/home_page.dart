import 'package:flutter/material.dart';

class HomeLayoutPage extends StatefulWidget {
  static const String routeName = '/homePage';
  const HomeLayoutPage({Key? key}) : super(key: key);

  @override
  State<HomeLayoutPage> createState() => _HomeLayoutPageState();
}

class _HomeLayoutPageState extends State<HomeLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home")));
  }
}
