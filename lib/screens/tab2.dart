import 'package:flutter/material.dart';
import 'package:flutter_application_users/models/user_data.dart';
import 'package:provider/provider.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
        builder: (context, userData, child) => ListView.builder(
              itemCount: userData.bookmarkedUsers.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                    userData.bookmarkedUsers[index].avatarUrl,
                  ),
                ),
                title: Text(userData.bookmarkedUsers[index].name),
                trailing: Checkbox(
                  value: true,
                  onChanged: (newValue) {
                    if (newValue == false) {
                      for (int i = 0; i < userData.users.length; i++) {
                        if (userData.bookmarkedUsers[index].name ==
                            userData.users[i].name) {
                          userData.users[i].isChecked = false;
                        }
                      }
                      userData.removeUsers(userData.bookmarkedUsers[index]);
                    }
                  },
                ),
              ),
            ));
  }
}
