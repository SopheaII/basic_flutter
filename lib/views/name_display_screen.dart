import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/bloc/name_bloc.dart';

class NameDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Display Screen'),
      ),
      body: Center(
        child: BlocBuilder<NameBloc, NameState>(
          builder: (context, state) {
            return Text(
              'Hello, ${state.name}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
    );
  }
}
