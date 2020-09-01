import 'package:flutter/material.dart';
import 'package:nestingscroll/NestingScrollWidget.dart';

class ViewDemo extends StatefulWidget {
  const ViewDemo({Key key, this.parentPageController,this.pageName}) : super(key: key);
  final PageController parentPageController;
  final String pageName;
  @override
  _ViewDemoState createState() => _ViewDemoState();
}

class _ViewDemoState extends State<ViewDemo>
    with AutomaticKeepAliveClientMixin {
  //AutomaticKeepAliveClientMixin 为了保持pageview切换的state不变
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          //主题列表
          height: 50,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: NestingScrollWidget(
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: ClipOval(
                            child: Container(
                          constraints:
                              BoxConstraints.tightFor(width: 50, height: 50),
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                          ),
                        )));
                  }),
              parentScrollController: widget.parentPageController)),
      Container(
        //推荐pageview
        height: 300,
        margin: EdgeInsets.only(bottom: 20),
        child: NestingScrollWidget(
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 300,
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 300,
                  alignment: Alignment.center,
                  child: Text("2",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center),
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
            parentScrollController: widget.parentPageController),
      ),
      Container(
        width: 200,
        height: 200,
        color: Colors.deepOrange[100],
        child: Text(widget.pageName,style: TextStyle(fontSize: 30),),
      )
    ]));
  }

  @override
  bool get wantKeepAlive => true;
}
