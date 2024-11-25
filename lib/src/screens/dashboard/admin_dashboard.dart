import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, Admin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate or trigger admin-specific actions
              },
              child: Text('Manage Users'),
            ),
            ElevatedButton(
              onPressed: () {
                // Another admin action
              },
              child: Text('View Reports'),
            ),
            ElevatedButton(
              onPressed: () {
                // Log out logic or navigation
                Navigator.pop(context);
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
