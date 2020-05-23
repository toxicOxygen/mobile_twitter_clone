import 'package:meta/meta.dart';

class User{
  final String id;
  final String username;
  final String location;
  final String profilePhotoUrl;
  final String coverPhotoUrl;
  final String bio;
  final DateTime dateOfBirth;
  final String website;

  User({
    @required this.id,
    @required this.username,
    this.location,
    this.coverPhotoUrl,
    this.bio,
    this.dateOfBirth,
    this.profilePhotoUrl,
    this.website
  });
}