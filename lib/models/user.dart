import 'package:mobx/mobx.dart';

part 'user.g.dart';

class User extends _User with _$User {}

abstract class _User with Store {
  @observable
  String name;
  @observable
  String avatarUrl;
  @observable
  bool isChecked;

  _User({this.name, this.avatarUrl, this.isChecked = false});
}
