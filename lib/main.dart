import 'package:flutter/material.dart';
import 'package:flutter_application_users/models/user_data.dart';
import 'package:flutter_application_users/screens/tab1.dart';
import 'package:flutter_application_users/screens/tab2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ChangeNotifierProvider<UserData>(
        create: (context) => UserData(),
        child: MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              appBar: AppBar(
                title: Text('User manager'),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text('Users'),
                      icon: Icon(Icons.person),
                    ),
                    Tab(
                      child: Text('Bookmarked users'),
                      icon: Icon(Icons.bookmark),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [Tab1(), Tab2()],
              ),
            )),
      ),
    );
  }
}
