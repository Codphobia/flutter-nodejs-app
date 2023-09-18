import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:notekeep/model/note.dart';
import 'package:notekeep/repository/note_repo.dart';

class NoteController extends GetxController {
  List<NoteKeep> note = [];
  final noteRepo = NoteRepo();
  RxBool isLoading = false.obs;
  @override
  void onReady() async {
    super.onReady();
    if (kDebugMode) {
      print('ready');
    }
    isLoading.value = true;
    note = (await noteRepo.getNoteList())!;
    print(note.length.toString());
    isLoading.value = false;
    update();
  }

  addNote({required NoteKeep noteKeep})   {
    note.add(noteKeep);
      noteRepo.addNote(noteKeep: noteKeep);
    update();
    Get.back<void>();
  }

  deleteNote({required NoteKeep noteKeep}) async {
    final indexVal =
        note.indexOf(note.firstWhere((element) => element.id == noteKeep.id));
    note.removeAt(indexVal);
    await noteRepo.deleteNote(noteKeep: noteKeep);
    update();
  }

  updateNote({required NoteKeep noteKeep}) async {
    final indexVal =
        note.indexOf(note.firstWhere((element) => element.id == noteKeep.id));
    note[indexVal] = noteKeep;
    await noteRepo.updateNote(noteKeep: noteKeep);
    update();
    Get.back<void>();
  }
}
