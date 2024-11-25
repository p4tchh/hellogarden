import 'package:flutter/material.dart';


class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, User!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate or trigger user-specific actions
              },
              child: Text('View Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                // Another user action
              },
              child: Text('Browse Content'),
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
