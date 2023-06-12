import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      margin: EdgeInsets.all(8),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Container(
        padding: EdgeInsets.all(8),
        //margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child:
                  //cach network image it is prevent form alot of loading
                  CachedNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                    height: 160,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

              // Image.network(
              //   article.urlToImage?? "",
              //   height: 160,
              // fit: BoxFit.fill,),
            ),
            Text(
              article.title ?? "",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF707070),
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              article.description ?? "",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              article.author ?? "",
              style: TextStyle(
                fontSize: 8,
                color: Colors.black45,
              ),
            ),
            Text(
              article.publishedAt?.substring(0, 10) ?? "",
              style: TextStyle(
//we make substing to take the date only
                fontSize: 13, color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
