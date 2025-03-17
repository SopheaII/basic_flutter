import 'package:flutter/material.dart';
import 'package:app_test/views/activity_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/bloc/user_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    const Text('Pickup History'),
    const Text('Green Social'),
    const Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Set background color
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Pickup History'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Green Social'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Points: 100'),
          Text('Total Cash: \$10'),
          // Add point chart here
          ElevatedButton(
            onPressed: () {},
            child: Text('Schedule Pickup'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Redeem Points'),
          ),
          ListTile(
            title: Text('Recent Activity'),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityScreen()),
                );
              },
              child: Text('See all'),
            ),
          ),
          // Add recent activity list here
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                final user = state.user;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome, ${user.userName}!'),
                      Text('Email: ${user.email}'),
                    ],
                  ),
                );
              } else if (state is UserInitial) {
                return Center(child: Text('No user information available.'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
