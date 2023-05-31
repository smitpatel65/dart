import 'package:hive/hive.dart';
import 'package:my_app/Models/nots_models.dart';

class Boxes {
  static Box<NotesModel> gatdata() => Hive.box<NotesModel>('notes');
}
