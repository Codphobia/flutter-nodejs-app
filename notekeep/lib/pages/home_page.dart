import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notekeep/controllers/note_controller.dart';
import 'package:notekeep/model/note.dart';
import 'package:notekeep/pages/add_note_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          'Note Keep',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: GetX<NoteController>(
        init: NoteController(),
        builder: (nk) {
          return nk.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : nk.note!.isEmpty
                  ? const Center(
                      child: Text('Note Not Yet!'),
                    )
                  : ListView.builder(
                      itemCount: nk.note!.length,
                      itemBuilder: (context, index) {
                        NoteKeep noteKeep = nk.note![index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) {
                                    return AddPage(
                                      isNoteUpdate: true,
                                      noteKeep: noteKeep,
                                    );
                                  },
                                ));
                          },
                          leading: CircleAvatar(child: Text(index.toString())),
                          title: Text(noteKeep.title),
                          subtitle: Text(noteKeep.description),
                          trailing: Column(children: [
                            IconButton(
                                onPressed: () {
                                  nk.deleteNote(noteKeep: noteKeep);
                                },
                                icon: const Icon(Icons.delete_outlined))
                          ]),
                        );
                      },
                    );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return AddPage(
                    isNoteUpdate: false,
                  );
                },
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
