class TrendingTag{
  final String title;
  final int numberOfTweets;

  TrendingTag({this.title,this.numberOfTweets});
}



List<TrendingTag> trendTags = [
  TrendingTag(title: 'Ezekiel',numberOfTweets: 3379),
  TrendingTag(title: '#speedDate',numberOfTweets: 2079),
  TrendingTag(title: 'Liverpool',numberOfTweets: 4079),
  TrendingTag(title: 'Obinim',numberOfTweets: 2301),
  TrendingTag(title: '#heisenberg',numberOfTweets: 1379),
];





class DummyUser{
  final String imageUrl;
  final String username;
  final String tag;
  final String recentMsg;
  final String date;

  DummyUser({this.tag,this.imageUrl,this.username,this.recentMsg,this.date});
}


List<DummyUser> users = [
  DummyUser(
    tag: '@bk_windfred',
    username: 'Windfred',
    recentMsg: 'But i follow her',
    imageUrl: 'https://tinyurl.com/y86y4ssl',
    date: 'Feb 16',
  ),
  DummyUser(
    tag: '@wesbos',
    username: 'Wes Bos',
    recentMsg: 'thanks you very much for the lessons',
    imageUrl: 'https://tinyurl.com/yb6qod88',
    date: 'Jul 3,2019'
  ),
  DummyUser(
    tag: '@mhiz_marsh',
    username: 'miz_marsh',
    recentMsg: 'oh okay',
    imageUrl: 'https://tinyurl.com/yawxco2g',
    date: 'Feb 11,2019'
  ),
];