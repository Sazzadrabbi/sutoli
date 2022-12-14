import 'package:flutter/foundation.dart';

import '../db/dbmanager.dart';

class UserProvider extends ChangeNotifier {
  Future<bool> isBuyer(String email) => DataBaseManager.isUser(email);
}
