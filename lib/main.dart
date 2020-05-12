import 'package:flutter/material.dart';
import 'newsfeed.dart';
import 'description.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    NewsFeedPage.tag: (context) => NewsFeedPage(null),
    DescriptionPage.tag: (context) => DescriptionPage(null),
  
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Colors.black,
      body: NewsFeedPage(null)
      ),
      routes: routes,
    );
  }
}



// import 'package:flutter/material.dart';
// import 'newsfeed.dart';
// import 'description.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final routes = <String, WidgetBuilder>{
//     NewsFeedPage.tag: (context) => NewsFeedPage(null),
//     DescriptionPage.tag: (context) => DescriptionPage(null),
  
//   };

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//         //fontFamily: 'Nunito',
//       ),
//       home: NewsFeedPage(null),
//       routes: routes,
//     );
//   }
// }