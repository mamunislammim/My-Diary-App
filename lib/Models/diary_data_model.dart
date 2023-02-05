
import 'package:hive/hive.dart';
part 'diary_data_model.g.dart';

@HiveType(typeId: 0)
class DiaryData{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? comment;

  DiaryData({required this.title, required this.comment});
}