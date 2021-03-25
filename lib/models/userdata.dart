import 'package:demo_users/models/user.dart';
import 'package:demo_users/service/network.dart';
import 'package:mobx/mobx.dart';

part 'userdata.g.dart';

class UserData extends _UserData with _$UserData {}

abstract class _UserData with Store {
  @observable
  ObservableList<User> allUsers = ObservableList<User>();
  @observable
  ObservableList<User> bookmarkedUsers = ObservableList<User>();

  @action
  Future<void> getAllUser() async {
    Network network = Network();
    var data = await network.getUsers();
    for (var i in data) {
      User user = User();
      user.name = i['login'];
      user.avatarUrl = i['avatar_url'];
      allUsers.add(user);
    }
  }

  @action
  void addUser(User user) {
    bookmarkedUsers.add(user);
  }

  @action
  void removeUser(User user) {
    bookmarkedUsers.remove(user);
  }
}
