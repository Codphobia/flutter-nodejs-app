import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notekeep/controllers/note_controller.dart';
import 'package:notekeep/model/note.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatelessWidget {
  bool isNoteUpdate;
  NoteKeep? noteKeep;
  AddPage({super.key, required this.isNoteUpdate, this.noteKeep});

  TextEditingController titleC = TextEditingController();

  TextEditingController contentC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleC.text = noteKeep?.title ?? '';
    contentC.text = noteKeep?.description ?? "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          isNoteUpdate ? 'Update Note' : 'Add Note',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: [
            TextFormField(
              controller: titleC,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Title',
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            TextFormField(
              controller: contentC,
              decoration: const InputDecoration(
                label: Text('Content'),
                hintText: 'Content',
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(300, 52)),
                onPressed: () {
                  if (isNoteUpdate) {
                    NoteKeep notesKeep = NoteKeep(
                        id: noteKeep!.id,
                        userId: noteKeep!.userId,
                        title: titleC.text ?? noteKeep!.title,
                        description: contentC.text ?? noteKeep!.description,
                        dateAdded: DateTime.now());
                    Get.find<NoteController>().updateNote(noteKeep: notesKeep);
                  } else {
                    var uuid = Uuid();
                    final id = uuid.v1();
                    NoteKeep noteKeep = NoteKeep(
                        id: id,
                        userId: 'jamalkhanii691',
                        title: titleC.text,
                        description: contentC.text,
                        dateAdded: DateTime.now() );
                    Get.find<NoteController>().addNote(noteKeep: noteKeep);
                  }
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
