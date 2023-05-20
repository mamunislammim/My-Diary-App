// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import '../Models/diary_data_model.dart';
//
// class EditScreen extends StatefulWidget {
//   const EditScreen({Key? key, required this.data, required this.index})
//       : super(key: key);
//
//   final DiaryData? data;
//   final int? index;
//
//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }
//
// class _EditScreenState extends State<EditScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _diaryController = TextEditingController();
//
//   @override
//   void initState() {
//     _titleController.text = widget.data!.title.toString();
//     _diaryController.text = widget.data!.comment.toString();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Edit Diary"),
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
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   )),
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
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                   controller: _diaryController,
//                   minLines: 5,
//                   maxLines: 50,
//                   // expands: true,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//                 onPressed: (){
//                   setState(() {
//                     Box box = Hive.box("openBox");
//                     box.put((widget.index) ?? 0, DiaryData(title: _titleController.text, comment: _diaryController.text));
//                     Navigator.pop(context);
//                   });
//                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> DiaryPage()));
//                 },
//                 child: const Text("Save To Diary"))
//             //
//             // InkWell(
//             //   onTap: () {
//             //     setState(() {
//             //       Box box = Hive.box("openBox");
//             //       box.putAt(
//             //           widget.index ?? 0,
//             //           DiaryData(
//             //               title: _titleController.text,
//             //               comment: _diaryController.text));
//             //       Navigator.pop(context);
//             //     });
//             //   },
//             //   child: Container(
//             //     padding: const EdgeInsets.only(
//             //         top: 13, bottom: 13, left: 20, right: 20),
//             //     decoration: BoxDecoration(
//             //         borderRadius: BorderRadius.circular(15),
//             //         color: Colors.white),
//             //     child: const Text(
//             //       "Save to Diary",
//             //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             //     ),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
