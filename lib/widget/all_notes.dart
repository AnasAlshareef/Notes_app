import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todol/bloc/cubit/cubit/note_cubit.dart';
import 'package:todol/data/note.dart';

class AllNotes extends StatefulWidget {
  final Note note;

  const AllNotes({required this.note, super.key});

  @override
  State<AllNotes> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllNotes> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'edit', arguments: widget.note).then((value) => setState((){
          BlocProvider.of<NoteCubit>(context).get();
        }));
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            icon: Icon(Icons.add_alert),
            title: const Text("Delete"),
            content: const Text("Do you want to Delete this note?"),
            actions: <Widget>[
              TextButton(
                child: Text('Undo'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Delete'),
                onPressed: () {
                  BlocProvider.of<NoteCubit>(context).delete(widget.note);
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
        padding: const EdgeInsets.only(top: 13, right: 15, left: 15),
        decoration: const BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${widget.note.title}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              endIndent: 10,
              color: Colors.yellow,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.note.content}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
