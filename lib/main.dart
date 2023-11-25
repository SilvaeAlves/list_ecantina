import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/provider/users.dart';
import 'package:teste/routes/app_routes.dart';
import 'package:teste/views/user.list.dart';
import 'package:teste/views/user_form.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
      )
    ],
     child: MaterialApp(
       title: 'Flutter Demo',
       theme: ThemeData(
         primarySwatch: Colors.red,
         visualDensity: VisualDensity.adaptivePlatformDensity,
       ),
       routes: {
         AppRoutes.HOME: (_) => UserList(),
         AppRoutes.USER_FORM: (_) => UserForm()
       },
     ),
    );
  }
}


