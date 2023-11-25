import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/models/user.dart';
import 'package:teste/provider/users.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produtos'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if(isValid) {
                 _form.currentState?.save();
                  Provider.of<Users>(context, listen: false).put(User(

                     id: _formData['id'].toString(),
                     name: _formData['name'].toString(),
                     description: _formData['description'].toString(),
                     picture: _formData['picture'].toString(),
                 ));
                 Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Nome de Produto Inválido';
                  }

                  if(value.trim().length < 3){
                    return 'Nome de Produto muito pequeno. Digitar no mínimo 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _formData['descricao'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL Imagem'),
                onSaved: (value) => _formData['urlImagem'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
