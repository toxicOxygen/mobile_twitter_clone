import './comments.dart';
import './images.dart';

class Post {
  int id;
  int user;
  String tweet;
  List<PostImage> images;
  String created;
  List<Comment> comments;
  List<int> usersLike;

  Post(
      {this.id,
        this.user,
        this.tweet,
        this.images,
        this.created,
        this.comments,
        this.usersLike});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    tweet = json['tweet'];
    created = json['created'];

    if(json['comments'] != null){
      comments = List<Comment>();
      for(var comment in json['comments']){
        comments.add(Comment.fromJson(comment));
      }
    }

    if(json['images'] != null){
      images = List<PostImage>();
      for(var image in json['images']){
        images.add(PostImage.fromJson(image));
      }
    }

    if(json['images_like'] != null){
      usersLike = List<int>();
      for(var user in json['images_like']){
        usersLike.add(user);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['tweet'] = this.tweet;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['created'] = this.created;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    if (this.usersLike != null) {
      data['users_like'] = this.usersLike.map((v) => v).toList();
    }
    return data;
  }
}
