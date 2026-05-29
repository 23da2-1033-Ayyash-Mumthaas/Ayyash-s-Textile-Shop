import 'package:flutter/material.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Customer Support',
        onGoHome: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need help?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Email: support@ayyashtextile.shop'),
            SizedBox(height: 6),
            Text('Phone: +94 71 234 5678'),
            SizedBox(height: 6),
            Text('Working Hours: 9AM - 8PM, Monday to Saturday'),
          ],
        ),
      ),
    );
  }
}
