import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todol/bloc/cubit/cubit/note_cubit.dart';


import '../data/note.dart';
import '../widget/all_notes.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<NotesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NoteCubit>(context).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add,color: Color.fromRGBO(255, 255, 255, 1),),
        onPressed: ()
        {
          Navigator.pushNamed(context, 'Add' ,arguments: Note()).then((value) => setState((){
            BlocProvider.of<NoteCubit>(context).get();
          }));
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title : const Text(
          'Notes',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

      ),
      body: BlocBuilder<NoteCubit, TodoState>(builder: (context, state) {
        if (state is LoadedNotes) {
          final ta = state.note;
          return ListView.separated(
            physics: const ClampingScrollPhysics(),
              itemBuilder: (ctx , index){
              return AllNotes(note: ta[index]);
              },
              separatorBuilder: (BuildContext context, int i) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: ta!.length);
        }
        return  Center(child: Text('No Notes here yet!',style: TextStyle(color: Colors.white38,fontSize: 20),));
      }),
    );
  }
}
