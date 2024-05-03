import 'package:facility/aboutus.dart';
import 'package:facility/attendancelist.dart';
import 'package:facility/editprofile.dart';
import 'package:facility/feedback.dart';
import 'package:facility/frontpagescheduling.dart';
import 'package:facility/main.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JailTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OfficerListScreen(),
    );
  }
}

class OfficerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[850], // Set the background color to dark gray
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        toolbarHeight: 65.0, // Adjust the height of the app bar here
        leading: Builder(
          // Wrap with Builder to access Scaffold's context
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white, // Set the color of the drawer icon to white
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'icons/JailTrackLogo.png', // Provide the path to your logo image
              height: 60,
              width: 60, // Adjust the height of the logo as needed
            ),
            SizedBox(width: 10), // Add space between logo and title
            Text(
              'JailTrack',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'icons/JailTrackLogo.png', // Provide the path to your logo image
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'JailTrack',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                'icons/dashboard.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                // Navigate to Dashboard page
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/notification.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('Notification'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ViewOfficersPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // No transition animation
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/schedule.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('Scheduling System'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FrontschedulingPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // No transition animation
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/officer.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('View Officers'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ViewOfficersPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // No transition animation
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/requests.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('Officer Request'),
              onTap: () {
                // Navigate to Officer Request page
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/attendance.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('Attendance List'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AttendanceListPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // No transition animation
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/settings.png', // Provide the path to the dashboard image
                width: 30,
                height: 30,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SettingsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // No transition animation
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: 700, // Adjust the width as needed
          height: 800, // Adjust the height as needed
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Edit Profile'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            EditProfilePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child; // No transition animation
                        },
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('About Us'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            AboutUsPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child; // No transition animation
                        },
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Send Feedback'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FeedbackPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child; // No transition animation
                        },
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    // Handle Logout
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(child: Text('Dashboard Page')),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Center(child: Text('Sign In Page')),
    );
  }
}
