import 'package:demo_users/models/userdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserData>(context);
    return Observer(
      builder: (_) => ListView.builder(
        itemCount: userdata.bookmarkedUsers.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(userdata.bookmarkedUsers[index].avatarUrl),
          ),
          title: Text(userdata.bookmarkedUsers[index].name),
          trailing: Observer(
            builder: (_) => Checkbox(
              value: true,
              onChanged: (newValue) {
                for (int i = 0; i < userdata.allUsers.length; i++) {
                  if (userdata.allUsers[i].name ==
                      userdata.bookmarkedUsers[index].name) {
                    userdata.allUsers[i].isChecked = newValue;
                  }
                }
                userdata.bookmarkedUsers
                    .remove(userdata.bookmarkedUsers[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
