import 'package:flutter/material.dart';
import 'package:vbucks_store/screens/menu.dart';
import 'package:vbucks_store/screens/vbucksentry_form.dart';
import 'package:vbucks_store/screens/list_vbucksentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'VBucks',
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Your sigma skibidi VBucks store is here!",
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah VBucks'),
            // Bagian redirection ke VBucksEntryFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VBucksEntryFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Daftar VBucks'),
            onTap: () {
                // Route menu ke halaman vbucks
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VBucksEntryPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}