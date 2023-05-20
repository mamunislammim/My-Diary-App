// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:my_diary/Models/diary_data_model.dart';
//
// class WriteDiaryPage extends StatefulWidget {
//   const WriteDiaryPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<WriteDiaryPage> createState() => _WriteDiaryPageState();
// }
//
// class _WriteDiaryPageState extends State<WriteDiaryPage> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _diaryController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Write Diary"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white.withOpacity(.5)),
//                 child: TextField(
//                   controller: _titleController,
//                   decoration: InputDecoration(
//                       labelText: "Title",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       )),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white.withOpacity(.5)),
//                 child: TextFormField(
//                   controller: _diaryController,
//                   minLines: 5,
//                   maxLines: 50,
//                   // expands: true,
//                   decoration: InputDecoration(
//                       labelText: "Write here....",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             // ElevatedButton(
//             //     onPressed: (){
//             //      setState(() {
//             //       Box box = Hive.box("openBox");
//             //        box.add(DiaryData(
//             //            title: _titleController.text,
//             //            comment: _diaryController.text));
//             //          Navigator.pop(context);
//             //      });
//             //       // Navigator.push(context, MaterialPageRoute(builder: (context)=> DiaryPage()));
//             //     },
//             //     child: const Text("Save To Diary"))
//
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   Box box = Hive.box("openBox");
//                   box.add(DiaryData(
//                       title: _titleController.text,
//                       comment: _diaryController.text));
//                   Navigator.pop(context);
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.only(
//                     top: 13, bottom: 13, left: 20, right: 20),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.white),
//                 child: const Text(
//                   "Save to Diary",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
