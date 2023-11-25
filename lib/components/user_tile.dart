import 'package:flutter/material.dart';
import 'package:teste/routes/app_routes.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {

  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final picture = user.picture == null || user.picture.isEmpty
      ? CircleAvatar(child: Icon(Icons.person),)
      : CircleAvatar(backgroundImage: NetworkImage(user.picture));


    return ListTile(
      leading: picture,
      title: Text(user.name),
      subtitle: Text(user.description),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget> [
          IconButton(
              icon: Icon(Icons.edit),
            color: Colors.deepOrange,
            onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {  },
          ),
        ],
        ),
      ),
    );
  }
}
