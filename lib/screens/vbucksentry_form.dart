import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:vbucks_store/widgets/left_drawer.dart';
import 'package:vbucks_store/screens/menu.dart';

class VBucksEntryFormPage extends StatefulWidget {
  const VBucksEntryFormPage({super.key});

  @override
  State<VBucksEntryFormPage> createState() => _VBucksEntryFormPageState();
}

class _VBucksEntryFormPageState extends State<VBucksEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _vbucks = "";
	String _description = "";
	int _vbucksPrice = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah VBucks Kamu Hari ini',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
        		child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "VBucks",
                      labelText: "VBucks",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _vbucks = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "VBucks tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Description tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "VBucks price",
                      labelText: "VBucks price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _vbucksPrice = int.tryParse(value!) ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "VBucks price tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "VBucks price harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('VBucks berhasil tersimpan'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('VBucks: $_vbucks'),
                                      Text('Description: $_description'),
                                      Text('VBucksPrice: $_vbucksPrice'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                          final response = await request.postJson(
                                              "http://localhost:8000/create-flutter/",
                                              jsonEncode(<String, String>{
                                                  'vbucks': _vbucks,
                                                  'vbucks_price': _vbucksPrice.toString(),
                                                  'description': _description,
                                              }),
                                          );
                                          if (context.mounted) {
                                              if (response['status'] == 'success') {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                  content: Text("Mood baru berhasil disimpan!"),
                                                  ));
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => MyHomePage()),
                                                  );
                                              } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                      content:
                                                          Text("Terdapat kesalahan, silakan coba lagi."),
                                                  ));
                                              }
                                          }
                                      }
                                  },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
} 