import 'package:flutter/material.dart';
import 'package:vbucks_store/models/vbucks_entry.dart';
import 'package:vbucks_store/widgets/left_drawer.dart';

class VBucksEntryPage extends StatefulWidget {
  const VBucksEntryPage({super.key});

  @override
  State<VBucksEntryPage> createState() => _VBucksEntryPageState();
}

class _VBucksEntryPageState extends State<VBucksEntryPage> {
  Future<ListVBucksEntry>> fetchVBucks(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object VBucksEntry
    List<VBucksEntry> listVBucks = [];
    for (var d in data) {
      if (d != null) {
        listVBucks.add(VBucksEntry.fromJson(d));
      }
    }
    return listVBucks;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('VBucks Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchVBucks(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data vbucks pada mental health tracker.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.vbucks}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.feelings}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.vbucksIntensity}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.time}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

