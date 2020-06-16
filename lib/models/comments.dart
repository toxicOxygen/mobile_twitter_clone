import './users.dart';

class Comment {
  int id;
  String comment;
  User user;
  int post;
  String created;

  Comment({this.id, this.comment, this.user, this.post, this.created});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    post = json['post'];
    created = json['created'];
    user = json['user'] != null ? User.fromJson(json['user']):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user'] = this.user.toJson();
    data['post'] = this.post;
    data['created'] = this.created;
    return data;
  }
}