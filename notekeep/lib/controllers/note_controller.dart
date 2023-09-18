import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:notekeep/model/note.dart';
import 'package:notekeep/repository/note_repo.dart';

class NoteController extends GetxController {
  List<NoteKeep>? note = [];
  final noteReop = NoteRepo();
  RxBool isLoading = false.obs;
  @override
  void onReady() async {
    super.onReady();
    if (kDebugMode) {
      print('ready');
    }
    isLoading.value = true;
    note = await noteReop.getNoteList();
    print(note!.length.toString());
    isLoading.value = false;
  }

  addNote({required NoteKeep noteKeep}) {
    note!.add(noteKeep);
    noteReop.addNote(noteKeep: noteKeep);
    update();
    Get.back<void>();
  }

  deleteNote({required NoteKeep noteKeep}) {
    final indexVal =
        note!.indexOf(note!.firstWhere((element) => element.id == noteKeep.id));
    note!.removeAt(indexVal);
    noteReop.deleteNote(noteKeep: noteKeep);
    update();
  }

  updateNote({required NoteKeep noteKeep}) {
    final indexVal =
        note!.indexOf(note!.firstWhere((element) => element.id == noteKeep.id));
    note![indexVal] = noteKeep;
    noteReop.updateNote(noteKeep: noteKeep);
    update();
    Get.back<void>();
  }
}
