// screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isEditing = false;

  void _loadProfile() async {
    try {
      final profile = await _authService.getProfile();
      setState(() {
        _nameController.text = profile['name'];
        _emailController.text = profile['email'];
      });
    } catch (e) {
      print(e);
    }
  }

  void _updateProfile() async {
    try {
      await _authService.updateProfile(
        _nameController.text,
        _emailController.text,
      );
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update profile')));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                _updateProfile();
              } else {
                setState(() {
                  _isEditing = true;
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              enabled: _isEditing,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              enabled: _isEditing,
            ),
            if (!_isEditing)
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _authService.logout();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Text('Logout'),
              ),
          ],
        ),
      ),
    );
  }
}
