// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserData on _UserData, Store {
  final _$allUsersAtom = Atom(name: '_UserData.allUsers');

  @override
  ObservableList<User> get allUsers {
    _$allUsersAtom.reportRead();
    return super.allUsers;
  }

  @override
  set allUsers(ObservableList<User> value) {
    _$allUsersAtom.reportWrite(value, super.allUsers, () {
      super.allUsers = value;
    });
  }

  final _$bookmarkedUsersAtom = Atom(name: '_UserData.bookmarkedUsers');

  @override
  ObservableList<User> get bookmarkedUsers {
    _$bookmarkedUsersAtom.reportRead();
    return super.bookmarkedUsers;
  }

  @override
  set bookmarkedUsers(ObservableList<User> value) {
    _$bookmarkedUsersAtom.reportWrite(value, super.bookmarkedUsers, () {
      super.bookmarkedUsers = value;
    });
  }

  final _$getAllUserAsyncAction = AsyncAction('_UserData.getAllUser');

  @override
  Future<void> getAllUser() {
    return _$getAllUserAsyncAction.run(() => super.getAllUser());
  }

  final _$_UserDataActionController = ActionController(name: '_UserData');

  @override
  void addUser(User user) {
    final _$actionInfo =
        _$_UserDataActionController.startAction(name: '_UserData.addUser');
    try {
      return super.addUser(user);
    } finally {
      _$_UserDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeUser(User user) {
    final _$actionInfo =
        _$_UserDataActionController.startAction(name: '_UserData.removeUser');
    try {
      return super.removeUser(user);
    } finally {
      _$_UserDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allUsers: ${allUsers},
bookmarkedUsers: ${bookmarkedUsers}
    ''';
  }
}
