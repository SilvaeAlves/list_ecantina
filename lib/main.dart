import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/provider/users.dart';
import 'package:teste/screens/tela_abertura.dart';
import 'package:teste/screens/tela_cadastro.dart';
import 'package:teste/screens/tela_inicial_main.dart';
import 'package:teste/screens/tela_login_usuario.dart';
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
       title: 'E_Cantina',
       theme: ThemeData(
         primarySwatch: Colors.red,
         visualDensity: VisualDensity.adaptivePlatformDensity,
       ),
       initialRoute: '/',
       routes: {
         '/': (context) => OpenScreen(),
          '/Login': (context) => LoginScreenUser(),
         '/Register': (context) => RegisterScreen(),
         '/Menu':(context) => HomeScreen(),
         '/Products':(context) => UserList(),
         '/Form':(context) => UserForm(),
     //    '/home': (context) => LoginScreen(),
    //     AppRoutes.HOME: (_) => UserList(),
    //     AppRoutes.USER_FORM: (_) => UserForm()
      },
     ),
    );
  }
}


