import 'package:flutter_use_case/core/data/model/user.dart';

abstract class AuthenticationOperation {
  Future<List<User>> users();
}