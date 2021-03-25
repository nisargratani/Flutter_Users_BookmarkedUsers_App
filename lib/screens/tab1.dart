import 'package:demo_users/models/userdata.dart';
import 'package:demo_users/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  void initState() {
    Provider.of<UserData>(context, listen: false).getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserData>(context);
    return Observer(
        builder: (_) => userdata.allUsers.length == 0
            ? Loading()
            : ListView.builder(
                itemCount: userdata.allUsers.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(userdata.allUsers[index].avatarUrl),
                  ),
                  title: Text(userdata.allUsers[index].name),
                  trailing: Observer(
                    builder: (_) => Checkbox(
                        value: userdata.allUsers[index].isChecked,
                        onChanged: (newValue) {
                          userdata.allUsers[index].isChecked = newValue;
                          if (newValue == true) {
                            userdata.bookmarkedUsers
                                .add(userdata.allUsers[index]);
                          }
                          if (newValue == false) {
                            userdata.bookmarkedUsers
                                .remove(userdata.allUsers[index]);
                          }
                        }),
                  ),
                ),
              ));
  }
}
