import 'package:flutter/material.dart';
import '../models/images.dart';

class ImagesGridWidget extends StatelessWidget {
  final List<PostImage> images;
  final double height;

  ImagesGridWidget({@required this.images,@required this.height});

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
      child: ClipRRect(
        child: _buildGrid(),
        borderRadius: BorderRadius.circular(20),
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
