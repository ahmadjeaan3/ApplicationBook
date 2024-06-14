// ignore_for_file: prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:book_application/src/providers/ProfileProvider.dart';
import 'package:book_application/src/providers/auth_provider.dart';
import 'package:book_application/src/providers/auth_provider2.dart';
import 'package:book_application/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthProvider2>(
        builder: (context, authProvider, child) {
          return authProvider.isLoggedIn ? ProfilePage() : LoginScreen();
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Icon(
            Icons.menu_open_rounded,
            size: 35,
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            profileProvider.name.isEmpty ? 'User Name' : profileProvider.name,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            profileProvider.email.isEmpty
                ? 'user@example.com'
                : profileProvider.email,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ProfileOption(
                  icon: Icons.favorite_border,
                  title: 'Favourites',
                ),
                ProfileOption(
                  icon: Icons.shopping_cart_outlined,
                  title: 'Orders',
                ),
                ProfileOption(
                  icon: Icons.payment,
                  title: 'Payments',
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[300],
                  indent: 15,
                  endIndent: 15,
                ),
                ProfileOption(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                ),
                ProfileOption(
                  icon: Icons.card_giftcard,
                  title: 'Promo Code',
                ),
                ProfileOption(
                  icon: Icons.language,
                  title: 'Language',
                ),
                ProfileOption(
                  icon: Icons.star_border,
                  title: 'Rate App',
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[300],
                  indent: 15,
                  endIndent: 15,
                ),
              ],
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
              
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.green,
                    size: 35,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'New Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'New Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                profileProvider.updateName(_nameController.text);
                profileProvider.updateEmail(_emailController.text);
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;

  ProfileOption({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          leading: Icon(
            icon,
            color: Colors.green,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 16,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
