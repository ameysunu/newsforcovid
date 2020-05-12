import 'package:flutter/material.dart';
import 'package:news/article.dart';
import 'package:news/description.dart';
class NewsList extends StatelessWidget {
  final List<NewsArticle> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
            ),
            title: Text(news[index].title),
            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DescriptionPage(url),
                  ));
            },
          ),
        );
      },
    );
  }
}