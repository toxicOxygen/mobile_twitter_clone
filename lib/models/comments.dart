import './users.dart';

class Comment{
  final String id;
  final String comment;
  final User user;
  final String postId;
  final DateTime date;

  Comment({this.date,this.comment,this.user,this.postId,this.id});
}