import 'package:facility/attendancelist.dart';
import 'package:facility/frontpagescheduling.dart';
import 'package:facility/main.dart';
import 'package:facility/settingsfacility.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Shift {
  final String userId;
  final String officerName;
  final String designation;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  Shift({
    required this.userId,
    required this.officerName,
    required this.designation,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });
}

class SchedulingPage extends StatefulWidget {
  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  List<Shift> shifts = [];
  List<String> designations = [
    'Team A',
    'Team B',
    'Team C'
  ]; // Example designations

  @override
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
              'icons/JailTrackLogo.png', // Ensure you have this image in your assets
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
                color: Color.fromARGB(255, 54, 53, 53),
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
                          color: Colors.white,
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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _showAddShiftDialog(),
            child: Text('Add Shift'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(120),
                  1: FixedColumnWidth(200),
                  2: FixedColumnWidth(100),
                  3: FixedColumnWidth(100),
                },
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      'Officer Name',
                      'Designation',
                      'Start Time',
                      'End Time',
                    ]
                        .map((text) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(text,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ))
                        .toList(),
                  ),
                  ...shifts.map((shift) {
                    return TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(shift.officerName),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(shift.designation),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${shift.startTime.format(context)}'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${shift.endTime.format(context)}'),
                      ),
                    ]);
                  }).toList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddShiftDialog() {
    String userId = '123'; // Example user ID, can be made editable
    String officerName = '';
    String?
        designation; // Allow it to be null initially if there is no default value
    DateTime? startDate;
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Shift'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => officerName = value,
                  decoration: InputDecoration(labelText: 'Officer Name'),
                ),
                DropdownButtonFormField<String>(
                  value: designation, // It might be null initially
                  onChanged: (String? newValue) {
                    setState(() {
                      designation = newValue!;
                    });
                  },
                  items: designations
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Designation'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (date != null) {
                            setState(() {
                              startDate = date;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Start Date: ${startDate != null ? DateFormat('yyyy-MM-dd').format(startDate!) : 'Select Date'}',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            setState(() {
                              startTime = time;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Start Time: ${startTime != null ? startTime!.format(context) : 'Select Time'}',
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        endTime = time;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText:
                        'End Time: ${endTime != null ? endTime!.format(context) : 'Select Time'}',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (officerName.isNotEmpty &&
                    designation!.isNotEmpty &&
                    startDate != null &&
                    startTime != null &&
                    endTime != null) {
                  Shift newShift = Shift(
                    userId: userId,
                    officerName: officerName,
                    designation: designation ??
                        '', // Handle null by setting a default empty string or another logic
                    startDate: startDate!,
                    endDate: startDate!, // Assuming one-day shift
                    startTime: startTime!,
                    endTime: endTime!,
                  );
                  setState(() {
                    shifts.add(newShift);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save Shift'),
            ),
          ],
        );
      },
    );
  }
}
