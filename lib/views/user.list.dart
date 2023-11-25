
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/components/user_tile.dart';
import 'package:teste/provider/users.dart';
import 'package:teste/routes/app_routes.dart';

import '../data/dummy_users.dart';
import '../models/user.dart';

class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM
                );
          },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, i) => UserTile(users.byIndex(i))
      )
    );
  }
}