import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_diary/Models/diary_data_model.dart';
import 'package:my_diary/Screens/write_diary_page.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  Box? box;

  @override
  void initState() {
    Hive.box("openBox");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Type Adapter"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box("openBox").listenable(),
                builder: (_, box, widget) {
                  List keys = box.keys.toList();
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: keys.length,
                      itemBuilder: (_, index) {
                        DiaryData data = box.getAt(keys[index]);
                        return ListTile(
                          title: Text(data.title.toString()),
                          subtitle:
                              Text(data.comment!.substring(0, 5).toString()),
                          leading: const Icon(Icons.bookmark_added_outlined),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {}, child: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text("Delete..!!!"),
                                        content: const Text(
                                            "Are you sure Delete This Notes ??"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                // box.deleteAt(keys[index]);
                                                box.delete(keys[index]);
                                              },
                                              child: const Text("Delete")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel"))
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.delete)),
                            ],
                          ),
                        );
                      });
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WriteDiaryPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
