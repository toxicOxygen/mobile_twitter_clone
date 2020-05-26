import 'package:flutter/material.dart';
import '../models/images.dart';
import '../pages/view_tweet_image_page.dart';

class ImagesGridWidget extends StatelessWidget {
  final List<PostImage> images;
  final int postId;
  final double height;

  ImagesGridWidget({
    @required this.images,
    @required this.height,
    @required this.postId
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(0.05),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(
            TweetImageViewPage.tag,
            arguments:{'id':postId}
          );
        },
        child: ClipRRect(
          child: _buildGrid(),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }


  Widget _buildGrid(){
    if(this.images.length == 1){
      return Image.network(
        images[0].image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }else if(this.images.length == 2){
      return  Row(
        children: <Widget>[
          Expanded(
            child: Image.network(
              images[0].image,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          SizedBox(width: 2,),
          Expanded(
            child: Image.network(
              images[1].image,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          )
        ],
      );
    }
    return  Row(
      children: <Widget>[
        Expanded(
          child: Image.network(
            images[0].image,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        SizedBox(width: 2,),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  images[1].image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 2,),
              Expanded(
                child: Image.network(
                  images[2].image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
