
import 'package:hive/hive.dart';

part 'hive_entity.g.dart';

@HiveType(typeId: 0)
class HiveEntity {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String price;


  @HiveField(2)
  final String id;

  HiveEntity({
    required this.title,
    required this.price,
    required this.id,
});


}

