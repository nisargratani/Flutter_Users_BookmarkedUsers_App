import 'package:flutter_application_users/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_users/services/network.dart';

class UserData extends ChangeNotifier {
  List<User> users = List<User>();
  List<User> bookmarkedUsers = List<User>();

  Future<void> getUsers() async {
    NetworkHelper networkHelper = NetworkHelper();
    var usersData = await networkHelper.getUsers();
    for (var i in usersData) {
      User user = User();
      user.name = i['login'];
      user.avatarUrl = i['avatar_url'];
      users.add(user);
    }
    notifyListeners();
  }

  void addUsers(User user) {
    bookmarkedUsers.add(user);
    notifyListeners();
  }

  void removeUsers(User user) {
    bookmarkedUsers.remove(user);
    notifyListeners();
  }
}
