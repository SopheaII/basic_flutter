import 'package:app_test/views/basic_widget.dart';
import 'package:app_test/views/bloc_screen.dart';
import 'package:app_test/views/login_screen.dart';
import 'package:app_test/bloc/name_bloc.dart';
import 'package:app_test/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameBloc>(
          create: (context) => NameBloc(),
        ),
        // Add other BLoCs here
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue[200],
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Text(widget.title,
//         style: TextStyle(
//           fontWeight: FontWeight.bold
//         ),),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => BlocScreen()),
//                 );
//               },
//               child: Text('Bloc Screen', style: TextStyle(fontSize: 20)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
