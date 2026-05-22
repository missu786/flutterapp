import 'api_service.dart';

class LogService {
  static Future save(String action) async {
    var log = {
      "user_id": "1",
      "action": action,
      "time": DateTime.now().toString(),
    };

    print("LOG: $log");
    await ApiService.sendLog(log);
  }
}