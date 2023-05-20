import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_diary/Models/diary_data_model.dart';
import 'package:my_diary/Screens/data_add_update_page.dart';
import 'package:my_diary/Screens/write_diary_page.dart';

import 'edit_screen.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff67b9c7),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset(
                "image/m.png",
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              "Developer : MD Mamun Islam",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const Text(
              "Contact : 01761810531",
              style: TextStyle(color: Colors.blue, fontSize: 17),
            )
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff67b9c7),
        title: const Text("My Diary"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box("diaryBox").listenable(),
                builder: (_, box, widget) {
                  List key = box.keys.toList();

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: key.length,
                      itemBuilder: (_, index) {
                        DiaryData data = box.get(key[index]);

                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 7, right: 7),
                          child: Card(
                            color: Colors.grey.shade300,
                            child: ListTile(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => EditScreen(
                                //               data: data,
                                //               index: key[index],
                                //             )));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DataAddUpdatePage(
                                              index: key[index],
                                              data: data,
                                            )));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: Colors.grey.shade200,
                              title: Text(
                                // data.title.toString().toUpperCase(),
                                "${data.title!.substring(0, 1).toUpperCase()}${data.title}",
                                style: const TextStyle(
                                  color: Color(0xff1b7f91),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              leading: const Icon(
                                Icons.note_alt_sharp,
                                color: Color(0xff67b9c7),
                                size: 40,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
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
                                                    print(
                                                        "delete : ${key[index]}");
                                                    box.delete(key[index]);
                                                    Navigator.pop(context);
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
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff67b9c7),
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const WriteDiaryPage()));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DataAddUpdatePage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
