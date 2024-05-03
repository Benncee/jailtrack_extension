import 'package:flutter/material.dart';

class Schedule {
  String escortTeam;
  String escortDriver;
  String designation;
  DateTime dateStart;
  TimeOfDay timeIn;
  TimeOfDay timeOut;
  String destinationFrom;
  String destinationTo;

  Schedule({
    required this.escortTeam,
    required this.escortDriver,
    required this.designation,
    required this.dateStart,
    required this.timeIn,
    required this.timeOut,
    required this.destinationFrom,
    required this.destinationTo,
  });
}

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scheduling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScheduleForm(),
    );
  }
}

class ScheduleForm extends StatefulWidget {
  @override
  _ScheduleFormState createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _escortTeamController;
  late TextEditingController _escortDriverController;
  late TextEditingController _designationController;
  late TextEditingController _destinationFromController;
  late TextEditingController _destinationToController;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTimeIn = TimeOfDay.now();
  TimeOfDay _selectedTimeOut = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _escortTeamController = TextEditingController();
    _escortDriverController = TextEditingController();
    _designationController = TextEditingController();
    _destinationFromController = TextEditingController();
    _destinationToController = TextEditingController();
  }

  @override
  void dispose() {
    _escortTeamController.dispose();
    _escortDriverController.dispose();
    _designationController.dispose();
    _destinationFromController.dispose();
    _destinationToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _escortTeamController,
                decoration: InputDecoration(labelText: 'Select Escort Team'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the escort team';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _escortDriverController,
                decoration: InputDecoration(labelText: 'Assign Escort Driver'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the escort driver';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _designationController,
                decoration:
                    InputDecoration(labelText: 'Designation/Assignment'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the designation';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date Start'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Selected Date: $_selectedDate"),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectTime(context, isTimeIn: true),
                      child: Text('Time In'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Selected Time In: ${_selectedTimeIn.format(context)}"),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectTime(context, isTimeIn: false),
                      child: Text('Time Out'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                      "Selected Time Out: ${_selectedTimeOut.format(context)}"),
                ],
              ),
              TextFormField(
                controller: _destinationFromController,
                decoration: InputDecoration(labelText: 'Destination From'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the destination from';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _destinationToController,
                decoration: InputDecoration(labelText: 'Destination To'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the destination to';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveForm();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text('Save'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context,
      {required bool isTimeIn}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isTimeIn ? _selectedTimeIn : _selectedTimeOut,
    );
    if (picked != null &&
        picked != (isTimeIn ? _selectedTimeIn : _selectedTimeOut))
      setState(() {
        if (isTimeIn) {
          _selectedTimeIn = picked;
        } else {
          _selectedTimeOut = picked;
        }
      });
  }

  void _saveForm() {
    Schedule schedule = Schedule(
      escortTeam: _escortTeamController.text,
      escortDriver: _escortDriverController.text,
      designation: _designationController.text,
      dateStart: _selectedDate,
      timeIn: _selectedTimeIn,
      timeOut: _selectedTimeOut,
      destinationFrom: _destinationFromController.text,
      destinationTo: _destinationToController.text,
    );

    // Display output (you can adjust this part according to your needs)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Scheduled Information"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Escort Team: ${schedule.escortTeam}"),
              Text("Escort Driver: ${schedule.escortDriver}"),
              Text("Designation/Assignment: ${schedule.designation}"),
              Text("Date Start: ${schedule.dateStart.toString()}"),
              Text("Time In: ${schedule.timeIn.format(context)}"),
              Text("Time Out: ${schedule.timeOut.format(context)}"),
              Text("Destination From: ${schedule.destinationFrom}"),
              Text("Destination To: ${schedule.destinationTo}"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
