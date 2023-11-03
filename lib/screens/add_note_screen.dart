import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todol/bloc/cubit/cubit/note_cubit.dart';

import '../data/note.dart';

class AddNoteScreen extends StatefulWidget {
  final Note note;

  const AddNoteScreen({required this.note, super.key});

  @override
  State<AddNoteScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddNoteScreen> {
  final title = TextEditingController();
  final content = TextEditingController();
  bool hasValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.addListener(updateButtonVisibility);

  }
  void updateButtonVisibility() {
    setState(() {
      hasValue = title.text.isNotEmpty || content.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Note',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
          elevation: 0,
          leading:  BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.yellow, // <-- SEE HERE
          ),
          actions: [
           hasValue?
              IconButton(
                  onPressed: () {
                    final String t = title.text;
                    final String c = content.text;
                    final k = Note(title: t, content: c);
                    BlocProvider.of<NoteCubit>(context).add(k);

                  },

                icon: Icon(Icons.check,color: Colors.yellow,),
              ):Container()

          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              const Row(
                children: [
                  Text('Title',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: null,
                style:  TextStyle(
                    fontSize: 20,
                    color: Colors.white),
                controller: title,
                decoration: const InputDecoration(
                  focusColor: Colors.yellow,
                    isCollapsed: false,
                    border: InputBorder.none,
                    hintText: 'Enter Title For The Note ',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 20),),
              ),
              //Divider(color:Colors.yellow ,endIndent: 30,),
              SizedBox(height: 10,),
              const Row(
                children: [
                  Text('Content',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
              TextField(
                 maxLines: null,
                controller: content,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white),
                decoration: const InputDecoration(
                    isCollapsed: false,
                    border: InputBorder.none,
                    hintText: 'Enter the content For The Note ',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
