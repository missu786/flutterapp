
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class LoggerService {

  static Future logActivity({
    required String action,
    required String details,
  }) async {

    var log = {
      'action': action,
      'details': details,
      'time': DateTime.now().toString()
    };

    var connectivity = await Connectivity().checkConnectivity();

    if(connectivity == ConnectivityResult.none){

      var box = Hive.box('logs');
      box.add(log);

    }else{

      await sendToServer(log);

    }
  }

  static Future sendToServer(Map log) async {

    await http.post(
      Uri.parse('https://yourdomain.com/api/save-log'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': '123456789'
      },
      body: jsonEncode(log),
    );
  }
}
