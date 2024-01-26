import 'package:flutter/material.dart';
import 'package:library_app/main.dart';
import 'package:library_app/components/bookstore.dart';
import 'package:library_app/pages/profile.dart';
import 'package:library_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homescreen extends StatefulWidget {
  final String username;

  Homescreen({required this.username});

  @override
  _Homescreen createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  String screen = "bookstore";

  void selectOption(String option) {
    setState(() {
      screen = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Hi ${widget.username}'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        'lib/images/user.png'), // Replace with your image
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              backgroundColor: Theme.of(context).colorScheme.background,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              'lib/images/user.png'), // Replace with your image
                        ),
                        SizedBox(height: 10),
                        Text(
                          'John Doe', // Replace with the user's name
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(AppLocalizations.of(context)!.home),
                    onTap: () {
                      // Navigate to home page or perform desired action
                      selectOption("bookstore");
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(AppLocalizations.of(context)!.profile),
                    onTap: () {
                      // Navigate to profile page or perform desired action
                      selectOption("profile");
                      Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text(AppLocalizations.of(context)!.darkMode),
                    onTap: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                      Navigator.pop(context);
                      // Navigate to settings page or perform desired action
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text(AppLocalizations.of(context)!.logout),
                    onTap: () {
                      // Perform logout action

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                ],
              ),
            ),
            body: screen == "bookstore"
                ? Bookstore()
                : ProfilePage(
                    userName: widget.username,
                  )));
  }
}
