import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_flutter_app/model/user_model.dart';
import 'package:user_flutter_app/provider/user_provider.dart';

class UserEditScreen extends StatefulWidget {
  final User user;

  UserEditScreen({required this.user});

  @override
  _UserEditScreenState createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _occupation;
  late String _bio;

  @override
  void initState() {
    _name = widget.user.name;
    _email = widget.user.email;
    _occupation = widget.user.occupation;
    _bio = widget.user.bio;
    super.initState();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<UserProvider>(context, listen: false).updateUser(
        widget.user.id,
        User(
          id: widget.user.id,
          name: _name,
          email: _email,
          occupation: _occupation,
          bio: _bio,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                initialValue: _occupation,
                decoration: InputDecoration(labelText: 'Occupation'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an occupation.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _occupation = value!;
                },
              ),
              TextFormField(
                initialValue: _bio,
                decoration: InputDecoration(labelText: 'Bio'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a bio.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bio = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
