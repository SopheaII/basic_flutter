import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/bloc/name_bloc.dart';
import 'package:app_test/views/name_display_screen.dart';

class BlocScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<NameBloc>().add(SetNameEvent(_nameController.text));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NameDisplayScreen()),
                );
              },
              child: Text('Set Name'),
            ),
          ],
        ),
      ),
    );
  }
}
