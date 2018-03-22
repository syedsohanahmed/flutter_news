import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'content_news.dart';
import 'content_featured.dart';
import 'search.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var _current_tab = 0;

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      body: new Container(
        color: Colors.grey[200],
        child:  new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              child: new SearchWidget(),
            ) ,
            new Expanded(
                child: _getContent(_current_tab)
            )
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigation(onTabNavigationBottom), // This trailing comma makes auto-formatting nicer for build methods.
    );


  }

  Widget _getContent(index){

    Widget content;
    switch(index){
      case 0: content = new ContentFeaturedPage(this);break;
      case 1: content = new ContentNewsPage(this);break;
      default: content = new Container(
        child: new Center(
          child: new Text("Em Breve"),
        ),
      );
    }

    return content;
  }

  onTabNavigationBottom(index){


    if(index != _current_tab) {

        setState((){
          _current_tab = index;
          }
        );


      /*if(!isFeatured) {

        var cat = 'geral';
        switch (widget._current_tab) {
          case 0:
            cat = 'geral';
            break;
          case 1:
            cat = 'technology';
            break;
          case 2:
            cat = 'sports';
            break;
          case 3:
            cat = 'entertainment';
            break;
        }
        content_news.state.loadCategory(cat, 0);

      }*/

    }

  }
}