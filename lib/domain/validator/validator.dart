import 'package:app_laundry/domain/validator/server_messages.dart';

class Validators {
  String serverMessage(String message) {
    final int _index = ServerMessages.messages
        .indexWhere((String element) => element == message);

    if (_index > -1) {
      return 'failure.serverMessages.$message';
    }
    return 'failure.serverMessages.unknown';
  }
}
