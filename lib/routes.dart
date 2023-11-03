import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todol/bloc/cubit/cubit/note_cubit.dart';
import 'package:todol/data/sp_helper.dart';
import 'package:todol/data/note.dart';
import 'package:todol/screens/add_note_screen.dart';
import 'package:todol/screens/edit_note.dart';
import 'package:todol/screens/notes_screen.dart';

class AppRouter {

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => NoteCubit(SpHelper()),
                child: NotesScreen(),
              ),
        );
      case 'Add':
        final tk = settings.arguments as Note;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => NoteCubit(SpHelper()),
                child: AddNoteScreen(note: tk),
              ),
        );
        case 'edit':
        final tk = settings.arguments as Note;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => NoteCubit(SpHelper()),
                child: EditNote(note: tk),
              ),
        );
    }
    return null;
  }
}