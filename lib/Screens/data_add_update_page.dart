import 'package:flutter/material.dart';
 import 'package:hive/hive.dart';
import 'package:my_diary/Screens/diary_page.dart';
import '../Models/diary_data_model.dart';

class DataAddUpdatePage extends StatefulWidget {
  const DataAddUpdatePage({Key? key, this.index, this.data}) : super(key: key);

  final int? index;
  final DiaryData? data;
  @override
  State<DataAddUpdatePage> createState() => _DataAddUpdatePageState();
}

class _DataAddUpdatePageState extends State<DataAddUpdatePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  Box? box;

  @override
  void initState() {
    if (widget.index != null || widget.data != null) {
      _titleController.text = widget.data!.title.toString();
      _detailsController.text = widget.data!.comment.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write Something"),
        backgroundColor: const Color(0xff67b9c7),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  hintText: "Please, Add a title",
                  labelText: "Title",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 5,
              controller: _detailsController,
              decoration: const InputDecoration(
                  hintText: "Writes your comment here.........",
                  labelText: "Description",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (_titleController.text == null ||
                    _titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      padding: EdgeInsets.all(20),
                      content: Text("Please Add a title..")));
                } else {
                  await addItem();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DiaryPage()));
                }
              },
              child: const Card(
                color: Color(0xff93c6da),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Save to Diary",
                        style:
                            TextStyle(color: Color(0xff174951), fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> addItem() async {
    box = Hive.box('diaryBox');
    if (widget.index != null) {
      print("\n\nif");
      box!.put(
          widget.index,
          DiaryData(
              title: _titleController.text, comment: _detailsController.text));
    } else {
      print("\n\nElse");
      box?.add(DiaryData(
          title: _titleController.text, comment: _detailsController.text));
    }
  }
}
