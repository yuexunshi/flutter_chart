/*
 * @Author: asi
 * @Date: 2021-04-24 14:59:22
 * @LastEditors: asi
 * @LastEditTime: 2021-04-24 17:11:06
 * @Description: file content
 * @FilePath: /flutter_chart/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'line_chart/line_chart_page1.dart';
import 'line_chart/line_chart_page2.dart';
import 'line_chart/line_chart_page3.dart';
import 'line_chart/line_chart_page4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0288D1),
        primaryColorDark: Color(0xFF01579B),
        // brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();
  int _currentIndex = 0;
  final List<Widget> pageList = [
    LineChartPage1(),
    LineChartPage2(),
    LineChartPage3(),
    LineChartPage4(),
  ];

  void _changeIndicator(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: _changeIndicator,
              children: pageList,
            ),
            Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          pageList.length,
                          (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ))),
                ))
          ],
        ),
      ),
    );
  }
}
