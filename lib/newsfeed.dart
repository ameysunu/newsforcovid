import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'description.dart';
import 'dart:io';

class NewsFeedPage extends StatelessWidget {
  static String tag = "NewsFeedPage-tag";
  NewsFeedPage(this.text);
  final int text;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
   String title;
   if (text == 1) {
      title = "Business";
    } else if(text == 2) {
      title = "Stocks";
    }  else if (text == 3) {
      title = "Technology";
    } else if (text == 4) {
      title = "Health";
    } 
    else if (text == 5) {
      title = "Sports";
    }
    else if (text == 6) {
      title = "Travel";
    }
    else if (text == 7) {
      title = "World News";
    }
    else if (text == 8) {
      title = "China";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: new Text("COVID-19 News",
        style: new TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text('Hello User!', 
                    style: TextStyle(color: Colors.white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
                    
                    ),

                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
            
            ),
            ListTile(
              title: Text('Business'),
              onTap: (){
                var id = 1;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
                
                
              }
            ),
             ListTile(
              title: Text('Stocks'),
              onTap: (){
               var id = 2;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
             ListTile(
              title: Text('Technology'),
              onTap: (){
               var id = 3;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
             ListTile(
              title: Text('Health'),
              onTap: (){
               var id = 4;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
             ListTile(
              title: Text('Sports'),
              onTap: (){
               var id = 5;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
             ListTile(
              title: Text('Travel'),
              onTap: (){
               var id = 6;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
             ListTile(
              title: Text('World News'),
              onTap: (){
               var id = 7;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
             ListTile(
              title: Text('China'),
              onTap: (){
               var id = 8;
                Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NewsFeedPage(id),
                ),
                );
              }
             ),
          ],
        ) ,
        ),
      body: new SafeArea(
          child: new Column(
        children: [
          new Expanded(
            flex: 1,
            child: new Container(
                width: width,
                color: Colors.black,
                child: new GestureDetector(
                  child: new FutureBuilder<List<News>>(
                    future: fatchNews(
                        http.Client(), text), // a Future<String> or null
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? NewsList(news: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                )),
          ),
        ],
      )),
    );
  }
}


Future<List<News>> fatchNews(http.Client client, id) async {
  String url;
  if (id == 1) {
    url = Constant.base_url +
        "top-headlines?country=us&category=business&apiKey=";
  } 
   else if (id == 2) {
    url = Constant.base_url +
        "everything?q=stocks&sortBy=publishedAt&apiKey=";
  } else if (id == 3) {
    url = Constant.base_url +
        "everything?q=technology&from=2020-05-13&to=2020-05-27&sortBy=popularity&apiKey=";
  } else if (id == 4) {
    url = Constant.base_url +
        "everything?q=health&from=2020-05-10&to=2020-05-27&sortBy=popularity&apiKey=";
  } else if (id == 5) {
    url = Constant.base_url +
        "everything?q=sports&from=2020-05-10&to=2020-05-27&sortBy=popularity&apiKey=";
  } else if (id == 6) {
    url = Constant.base_url +
        "everything?q=travel&from=2020-05-10&to=2020-05-27&sortBy=popularity&apiKey=";
  } else if (id == 7) {
    url = Constant.base_url +
        "everything?q=world&from=2020-05-10&to=2020-05-27&sortBy=popularity&apiKey=";
  } else if (id == 8) {
    url = Constant.base_url +
        "everything?q=china&from=2020-05-10&to=2020-05-27&sortBy=popularity&apiKey=";
  } 
  url = Constant.base_url +"everything?q=COVID-19&from=2020-05-27&sortBy=popularity&apiKey="; //Insert your apiKey here
  
  final response = await client.get(url);
  return compute(parsenews, response.body);

}

List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

class News {
  String auther;
  String title;
  String description;
  String url;

  News({this.auther, this.title, this.description, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

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
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
            title: Text(news[index].title, style: TextStyle(color: Colors.white),),
            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DescriptionPage(url),
                  ));
            },
          ),
          color: Colors.black,
        );
      },
    );
  }
}
