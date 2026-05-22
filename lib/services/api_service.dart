import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future sendLog(Map data) async {
    await http.post(
      Uri.parse("https://rholab.distrho.com/api/logs"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
  }
}