import 'package:facility/attendancelist.dart';
import 'package:facility/frontpagescheduling.dart';
import 'package:facility/main.dart';
import 'package:facility/settingsfacility.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
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
                // Navigate to Notification page
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
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
                // Navigate to View Officers page
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
                // Navigate to View Officers page
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
          width: 1800,
          height: 800,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 186, 186),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 300,
                  right: 0,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'icons/jail1.png',
                      width: 500,
                      height: 500,
                    ),
                  ),
                ),
                Positioned(
                  top: 270,
                  left: 0,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'icons/jail2.png',
                      width: 500,
                      height: 500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 20),
                      Text(
                        'JAILTRACK: A Face Recognition-Based Solution for Shift Scheduling and Attendance Monitoring of Jail Officers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Welcome to JAILTRACK, a cutting-edge face recognition-based solution designed to revolutionize shift scheduling and attendance monitoring for jail officers. Our innovative system harnesses the power of facial technology to streamline and enhance the management of jail personnel, ensuring a secure and efficient jail facility environment.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
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
