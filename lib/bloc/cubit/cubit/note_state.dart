part of 'note_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}
final class   LoadedNotes extends TodoState{
  final List<Note>? note;
  LoadedNotes(this.note);
}
final class NoteAdded extends TodoState{}
final class NoteDeleted extends TodoState{}
final class NoteUpdated extends TodoState{}


