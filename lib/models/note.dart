import 'package:isar/isar.dart';


//line of code needed for code generation
part 'note.g.dart';

@collection
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
