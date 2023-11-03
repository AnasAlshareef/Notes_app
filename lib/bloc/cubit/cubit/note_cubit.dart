// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:todol/data/sp_helper.dart';
import 'package:todol/data/note.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<TodoState> {
  final SpHelper spHelper;
  NoteCubit(
    this.spHelper,
  ) : super(TodoInitial());

  Future<void> get()async{
 final List<Note>? t = await spHelper.getTask();
emit(LoadedNotes(t));
  }
  Future<void> add (Note note)async{
    await spHelper.saveTask(note);
    emit(NoteAdded());
    get();
  }
  Future<void> delete(Note note)async{
    await spHelper.delete(note);
    emit(NoteDeleted());
    get();
  }
  Future<void> update(Note note)async{
    await spHelper.update(note);
    emit(NoteUpdated());
    get();
  }
}
