import 'package:flutter/material.dart';
import 'package:flutter_application_users/models/user_data.dart';
import 'package:flutter_application_users/screens/loading.dart';
import 'package:provider/provider.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  void initState() {
    Provider.of<UserData>(context, listen: false).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
        builder: (context, userData, child) => (userData.users.isEmpty
            ? Loading()
            : ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:
                        NetworkImage(userData.users[index].avatarUrl),
                  ),
                  title: Text(userData.users[index].name),
                  trailing: Checkbox(
                    value: userData.users[index].isChecked,
                    onChanged: (newValue) {
                      userData.users[index].isChecked = newValue;
                      if (newValue == true) {
                        userData.addUsers(userData.users[index]);
                      }
                      if (newValue == false) {
                        userData.removeUsers(userData.users[index]);
                      }
                    },
                  ),
                ),
                itemCount: userData.users.length,
              )));
  }
}
