import 'package:uuid/uuid.dart';

class User {
  late String id;
  late String mainProfilepicture;
  late String name;

  User() {
    id = const Uuid().v4();
  }

  User createNew() {
    return User()
      ..mainProfilepicture = "default"
      ..name = "default User";
  }
}
