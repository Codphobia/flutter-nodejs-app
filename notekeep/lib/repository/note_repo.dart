import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:notekeep/data/const.dart';
import 'package:notekeep/model/note.dart';
import 'package:http/http.dart' as http;

class NoteRepo {
  Future<void> addNote({required NoteKeep noteKeep}) async {
    try {
      String url = '${baseUrl}note/add';

      final res = await http.post(Uri.parse(url), body: noteKeep.toMap());
      if (res.statusCode == 200) {
        final js = jsonDecode(res.body);
        Get.snackbar('success', js['message'].toString());
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('error', e.toString());
    }
  }

  Future<void> deleteNote({required NoteKeep noteKeep}) async {
    try {
      String url = '${baseUrl}note/delete';

      final res = await http.post(Uri.parse(url), body: noteKeep.toMap());
      if (res.statusCode == 200) {
        final js = jsonDecode(res.body);
        Get.snackbar('success', js['message'].toString());
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('error', e.toString());
    }
  }

  Future<void> updateNote({required NoteKeep noteKeep}) async {
    try {
      String url = '${baseUrl}note/update';

      final res = await http.post(Uri.parse(url), body: noteKeep.toMap());
      if (res.statusCode == 200) {
        final js = jsonDecode(res.body);
        Get.snackbar('success', js['message'].toString());
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('error', e.toString());
    }
  }

  Future<List<NoteKeep>?> getNoteList() async {
    try {
      String url = '${baseUrl}note/list';

      final res = await http.get(
        Uri.parse(url),
      );
      if (res.statusCode == 200) {
        final js = jsonDecode(res.body);
        List<NoteKeep> noteList = [];

        for (var element in js) {
          NoteKeep noteKeep = NoteKeep.fromMap(element);
          noteList.add(noteKeep);
        }

        return noteList;
      }
      return [];
    } catch (e) {
      log(e.toString());
      Get.snackbar('error', e.toString());
      return [];
    }
  }
}
