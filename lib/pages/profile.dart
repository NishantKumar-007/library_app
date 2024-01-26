import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:library_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final String userName;

  ProfilePage({
    required this.userName,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.userName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Consumer<LocaleProvider>(
                    builder: (context, localeProvider, _) {
                      return DropdownButton<Locale>(
                        value: localeProvider.selectedLocale,
                        items: [
                          DropdownMenuItem(
                            value: Locale('en'),
                            child: Text('English'),
                          ),
                          DropdownMenuItem(
                            value: Locale('es'),
                            child: Text('Español'),
                          ),
                          // Add other languages as needed
                        ],
                        onChanged: (newLocale) {
                          localeProvider.setLocale(newLocale!);
                          print(newLocale);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Language updated"),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
