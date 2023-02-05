

import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
     const DetailsPage({Key? key,required this.title, required this.comment}) : super(key: key);
final  String? title;
 final  String? comment;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title.toString()),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.comment.toString(),style: TextStyle(
            color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
