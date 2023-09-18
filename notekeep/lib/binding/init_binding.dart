 
import 'package:get/get.dart';
import 'package:notekeep/controllers/note_controller.dart';

 
class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(() => NoteController());
   
    // Get.lazyPut<PostController>(() => PostController());
  }
}
