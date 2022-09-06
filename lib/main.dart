import 'package:flutter/material.dart';
import 'package:remote_notifications/screens/home_screen.dart';
import 'package:remote_notifications/screens/notifications_screen.dart';
import 'package:remote_notifications/screens/power_screen.dart';

void main() {
  runApp(const RemoteMonitoringApp());
}

class RemoteMonitoringApp extends StatelessWidget {
  const RemoteMonitoringApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remote Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const BottonNavigationWidget(),
    );
  }
}

class BottonNavigationWidget extends StatefulWidget {
  const BottonNavigationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _sections = [HomeScreen(), NotificationScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset(
        'assets/images/logo.png',
        height: 32,
        fit: BoxFit.contain,
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _sections[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
