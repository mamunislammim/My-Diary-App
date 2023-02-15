import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_diary/Models/diary_data_model.dart';
import 'package:my_diary/Screens/diary_page.dart';

class WriteDiaryPage extends StatefulWidget {
   const WriteDiaryPage({Key? key,}) : super(key: key);


  @override
  State<WriteDiaryPage> createState() => _WriteDiaryPageState();
}

class _WriteDiaryPageState extends State<WriteDiaryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _diaryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _diaryController,
                minLines: 5,
                maxLines: 50,
                // expands: true,
                decoration: InputDecoration(
                    labelText: "Write here....",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){
                 setState(() {
                  Box box = Hive.box("openBox");
                   box.add(DiaryData(
                       title: _titleController.text,
                       comment: _diaryController.text));
                     Navigator.pop(context);
                 });
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> DiaryPage()));
                },
                child: const Text("Save To Diary"))
          ],
        ),
      ),
    );
  }
}
