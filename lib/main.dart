import 'package:demo_users/models/userdata.dart';
import 'package:demo_users/screens/tab1.dart';
import 'package:demo_users/screens/tab2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<UserData>(
      create: (context) => UserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Users'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text('Users'),
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    child: Text('Bookmarked Users'),
                    icon: Icon(Icons.bookmark),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Tab1(),
                Tab2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
