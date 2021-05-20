import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/Bloc/UserEvent.dart';
import 'package:driver_app/Models/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc extends Bloc {
  List<User> _allUsers;
  List<User> get allUsers => _allUsers;

  StreamController<UserEvent> _userEventController =
      StreamController<UserEvent>.broadcast();

  StreamSink<UserEvent> get userEventSink => _userEventController.sink;

  Stream<UserEvent> get _userEventStream => _userEventController.stream;
  StreamController<User> _userDataController =
      StreamController<User>.broadcast();
  StreamSink<User> get userDataSink => _userDataController.sink;
  Stream<User> get userDataStream => _userDataController.stream;

  UserBloc() {
    _userEventStream.listen(mapEventToState);
  }
  Future<void> mapEventToState(UserEvent event) async {
    if (event is AddUser) {
      await FirebaseFirestore.instance
          .collection("Drivers")
          .doc(event.userId)
          .set(event.user.toJson(event.user.userId));
    } else if (event is FetchUser) {
      FirebaseFirestore.instance
          .collection("Drivers")
          .doc(event.userId)
          .snapshots()
          .listen((event) {
        userDataSink.add(User.fromMap(event.data()));
      });
    }
  }

  @override
  void dispose() {
    _userEventController.close();
    _userDataController.close();
  }
}
