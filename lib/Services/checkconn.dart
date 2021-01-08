import 'dart:async';
import 'dart:io';

class CheckConnection {
  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool hasConnection = false;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    return hasConnection;
  }
}
