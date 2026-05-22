
import 'package:flutter/material.dart';
import '../services/logger_service.dart';

class HomeScreen extends StatelessWidget {

  Future submitForm() async {

    await LoggerService.logActivity(
      action: 'FORM_SUBMIT',
      details: 'User submitted form'
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: submitForm,
          child: Text('Submit Form'),
        ),
      ),
    );
  }
}
