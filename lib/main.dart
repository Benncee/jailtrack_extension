import 'package:facility/attendancelist.dart';
import 'package:facility/frontpagescheduling.dart';
import 'package:facility/settingsfacility.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ViewOfficersPage());
}

class ViewOfficersPage extends StatelessWidget {
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
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        toolbarHeight: 65.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'icons/JailTrackLogo.png',
              height: 60,
              width: 60,
            ),
            SizedBox(width: 10),
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
                color: const Color.fromARGB(255, 54, 53, 53),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'icons/JailTrackLogo.png',
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'JailTrack',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
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
                'icons/dashboard.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Dashboard page
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/notification.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Notification'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Notification page
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/schedule.png',
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
                'icons/officer.png',
                width: 30,
                height: 30,
              ),
              title: const Text('View Officers'),
              onTap: () {
                // Navigate to View Officers page
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
                'icons/requests.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Officer Request'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Officer Request page
              },
            ),
            ListTile(
              leading: Image.asset(
                'icons/attendance.png',
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
                'icons/settings.png',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Officers',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Rank',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Mobile',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          30,
                          (index) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Name$index')),
                              DataCell(Text('Rank$index')),
                              DataCell(Text('Email$index')),
                              DataCell(Text('Mobile$index')),
                              DataCell(
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Implement delete action
                                  },
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: Text('View Officer Facial Data'),
                            value: 'view_facial_data',
                          ),
                        ];
                      },
                      icon: Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'view_facial_data') {
                          // Handle view officer facial data action
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
