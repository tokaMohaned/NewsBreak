
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
Articles article;
NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: Card(
        elevation: 16,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.transparent
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(article.urlToImage?? "",
              height: 160,
            fit: BoxFit.fill,),
            Text(article.title?? "",style:
              TextStyle(
                fontSize: 16,
                color: Color(0xFF707070),
              ),
            maxLines: 2,),
            SizedBox(height: 3,),
            Text(article.description?? ""),
            Text(article.author?? ""),
            Text(article.publishedAt?? ""),


          ],
        ),
      ),
    );
  }
}
