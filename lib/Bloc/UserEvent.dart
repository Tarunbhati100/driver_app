import 'package:driver_app/Models/user.dart';

abstract class UserEvent {}

class AddUser extends UserEvent {
  final String userId;
  final User user;
  AddUser({this.userId, this.user});
}
