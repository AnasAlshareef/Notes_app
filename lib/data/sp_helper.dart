import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todol/data/note.dart';

class SpHelper{
 Future<void> saveTask(Note note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> personJsonList = prefs.getStringList('Notes') ?? [];
    personJsonList.add(jsonEncode(note.toJson()));
    await prefs.setStringList('Notes', personJsonList);
    print(personJsonList);
    print('done');
  }

  Future<List<Note>> getTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notes = prefs.getStringList('Notes');
    if (notes != null) {
     return notes.map((encodedPerson) => Note.fromJson(json.decode(encodedPerson))).toList();
    } else {
      return [];
    }

  }

 Future<void> delete(Note note) async {
   final prefs = await SharedPreferences.getInstance();
   final objectList = prefs.getStringList('Notes') ?? [];
   final jsonString = json.encode(note.toJson());
   objectList.remove(jsonString);
   await prefs.setStringList('Notes', objectList);
 }
 Future<void> update(Note item) async {
   final prefs = await SharedPreferences.getInstance();
   final objectList = prefs.getStringList('Notes') ?? [];
   final jsonString = json.encode(item.toJson());
   final index = objectList.indexWhere((jsonString) => jsonString == jsonString);
   if (index != -1) {
     objectList[index] = jsonString;
     await prefs.setStringList('Notes', objectList);
   }
 }



}



