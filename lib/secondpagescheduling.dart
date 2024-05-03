import 'package:facility/attendancelist.dart';
import 'package:facility/frontpagescheduling.dart';
import 'package:facility/main.dart';
import 'package:facility/settingsfacility.dart';
import 'package:facility/testing.dart';
import 'package:flutter/material.dart';

class SecondschedulingPage extends StatelessWidget {
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

class OfficerListScreen extends StatefulWidget {
  @override
  _OfficerListScreenState createState() => _OfficerListScreenState();
}

class _OfficerListScreenState extends State<OfficerListScreen> {
  List<Team> teams = []; // Define teams list here

  void deleteTeam(Team team) {
    setState(() {
      teams.remove(team);
    });
  }

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
                  MaterialPageRoute(builder: (context) => Testing()),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the column vertically
            children: teams
                .map((team) => TeamTable(
                      team: team,
                      onDelete: () =>
                          deleteTeam(team), // Pass deleteTeam method
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TeamDialog(
                onCreate: (team) {
                  setState(() {
                    teams.add(team);
                  });
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Team {
  final String name;
  final List<String> members;

  Team({required this.name, required this.members});
}

class TeamTable extends StatelessWidget {
  final Team team;
  final VoidCallback onDelete;

  TeamTable({required this.team, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Team Name: ${team.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Team Members:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              // Added SingleChildScrollView here
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Officer Names:')),
                ],
                rows: team.members
                    .map(
                      (member) => DataRow(
                        cells: [
                          DataCell(Text(member)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamDialog extends StatefulWidget {
  final Function(Team) onCreate;

  TeamDialog({required this.onCreate});

  @override
  _TeamDialogState createState() => _TeamDialogState();
}

class _TeamDialogState extends State<TeamDialog> {
  late TextEditingController _nameController;
  late TextEditingController _membersController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _membersController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _membersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400, // Adjust width here
        height: 300, // Adjust height here
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Create New Team',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Team Name',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _membersController,
              decoration: InputDecoration(
                labelText: 'Members (comma-separated)',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final teamName = _nameController.text;
                    final members = _membersController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList();
                    final team = Team(name: teamName, members: members);
                    widget.onCreate(team);
                    Navigator.of(context).pop();
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ],
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
