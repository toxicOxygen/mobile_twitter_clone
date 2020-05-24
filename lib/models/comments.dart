class Comment {
  int id;
  String comment;
  int user;
  int post;
  String created;

  Comment({this.id, this.comment, this.user, this.post, this.created});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    user = json['user'];
    post = json['post'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user'] = this.user;
    data['post'] = this.post;
    data['created'] = this.created;
    return data;
  }
}