import 'package:hive/hive.dart';
part 'User.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String Username;

  @HiveField(1)
  final String image_url;

  @HiveField(2)
  final String Email;

  User({required this.Email, required this.Username, required this.image_url});
}
