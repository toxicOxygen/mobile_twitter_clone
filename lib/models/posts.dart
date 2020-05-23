class Post{
  final id;
  final List<String> images;
  final String tweet;
  final List<String> usersLike;
  final List<String> comments;

  Post({
    this.id,
    this.comments,
    this.images,
    this.tweet,
    this.usersLike 
  });
}