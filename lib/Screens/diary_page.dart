import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_diary/Models/diary_data_model.dart';
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
      backgroundColor: Colors.blueAccent,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset("image/m.png",fit: BoxFit.fill,),
            ),
            Text("Developer : MD Mamun Islam",style: TextStyle(color: Colors.blue,fontSize: 20),),
            Text("Contact : 01761810531",style: TextStyle(color: Colors.blue,fontSize: 17),)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("My Diary"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box("openBox").listenable(),
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
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditScreen(
                                            data: data,
                                            index: key[index],
                                          )));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tileColor: Colors.white.withOpacity(.9),
                            title: Text(
                              data.title.toString(),
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                           // subtitle: Text("hive Index : ${key[index]} Local in : $index"),
                            // subtitle: data.comment!.length <= 20
                            //     ? Text(
                            //        data.comment!.length.toString(),
                            //         style: const TextStyle(
                            //           color: Colors.brown,
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       )
                            //     : Text(
                            //         data.comment!.substring(0, 20).toString(),
                            //         style: const TextStyle(
                            //           color: Colors.brown,
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            leading: const Icon(
                              Icons.note_alt_sharp,
                              color: Colors.pinkAccent,
                              size: 40,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // InkWell(
                                //     onTap: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>EditScreen (
                                //                     data: data, index: keys[index],
                                //                   )));
                                //     },
                                //     child: const Icon(
                                //       Icons.edit,
                                //     )),
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
                                                  print("delete : ${key[index]}");
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
                        );
                      });
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WriteDiaryPage()));
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
