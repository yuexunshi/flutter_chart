/*
 * @Author: asi
 * @Date: 2021-04-24 16:08:09
 * @LastEditors: asi
 * @LastEditTime: 2021-04-24 17:38:44
 * @Description: file content
 * @FilePath: /flutter_chart/lib/line_chart/line_chart1.dart
 */

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartPage1 extends StatefulWidget {
  LineChartPage1({Key key}) : super(key: key);

  @override
  _LineChartPage1State createState() => _LineChartPage1State();
}

class _LineChartPage1State extends State<LineChartPage1> {
//? 是否可触摸
  bool enableLineTouchData = false;
//? 是否显示网格线
  bool showGridData = false;
//? 是否显示底边坐标
  bool showBottomTitles = true;
//? 是否显示边框
  bool showBorderData = true;
  //? 是否显示底部边框
  bool showBottomBorder = true;
  //? 是否显示侧边边框
  bool showLeftBorder = true;
//? 是否显示左侧坐标
  bool showlLeftTitles = true;
//? 是否显示左侧标题
  bool showAxisLeftTitle = true;
//? 是否显示底部标题
  bool showAxisBottomTitle = true;
//? 第一条线是否是曲线
  bool isCurved1 = true;
  //? 第二条线是否显示数据点
  bool showDotData2 = true;
  //? 粉线是否显示线下区域
  bool showBelowBarData = true;
  //? 绿线是否显示线下区域
  bool showAboveBarData = false;
  final buttonBorderTxt = [
    "显示边框",
    "显示底边",
    "显示侧边",
    "底部坐标",
    "侧边坐标",
    "显示网格",
    "侧边标题",
    "底部标题",
  ];
  final lineTxt = [
    "绿线是否曲线",
    "粉线显示数据点",
    "粉线线头方/圆",
    "是否可触摸",
    "粉线下方涂色",
    "绿线上方涂色",
  ];
  //? 蓝线线头是圆头还是方头
  bool isStrokeCapRound = true;

  void _setBorder(int index) {
    setState(() {
      switch (index) {
        case 0:
          showBorderData = !showBorderData;
          break;
        case 1:
          showBottomBorder = !showBottomBorder;
          break;
        case 2:
          showLeftBorder = !showLeftBorder;
          break;
        case 3:
          showBottomTitles = !showBottomTitles;
          break;
        case 4:
          showlLeftTitles = !showlLeftTitles;
          break;
        case 5:
          showGridData = !showGridData;
          break;
        case 6:
          showAxisLeftTitle = !showAxisLeftTitle;
          break;
        case 7:
          showAxisBottomTitle = !showAxisBottomTitle;
          break;
        default:
          break;
      }
    });
  }

  void _setLine(int index) {
    setState(() {
      switch (index) {
        case 0:
          isCurved1 = !isCurved1;
          break;
        case 1:
          showDotData2 = !showDotData2;
          break;
        case 2:
          isStrokeCapRound = !isStrokeCapRound;
          break;
        case 3:
          enableLineTouchData = !enableLineTouchData;
          break;
        case 4:
          showBelowBarData = !showBelowBarData;
          break;
        case 5:
          showAboveBarData = !showAboveBarData;
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("线形图"),
          SizedBox(
            height: 300,
            child: LineChart(
              sampleData(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            color: Colors.red,
          ),
          Text("外框属性"),
          Container(
            height: 150,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              padding: EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 10,
              childAspectRatio: 2,
              mainAxisSpacing: 20,
              children: List.generate(
                  buttonBorderTxt.length,
                  (index) => TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.cyan),
                      onPressed: () {
                        _setBorder(index);
                      },
                      child: Text(
                        buttonBorderTxt[index],
                        style: TextStyle(color: Colors.black),
                      ))),
            ),
          ),
          Text("线条属性"),
          Container(
            height: 300,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 10,
              childAspectRatio: 2,
              mainAxisSpacing: 20,
              children: List.generate(
                  lineTxt.length,
                  (index) => TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.cyan),
                      onPressed: () {
                        _setLine(index);
                      },
                      child: Text(
                        lineTxt[index],
                        style: TextStyle(color: Colors.black),
                      ))),
            ),
          )
        ],
      ),
    );
  }

  /// 配置文件
  LineChartData sampleData() {
    return LineChartData(
      //? 是否可以点击
      lineTouchData: LineTouchData(
        enabled: enableLineTouchData,
      ),
      //? 网格线配置
      gridData: FlGridData(
        show: showGridData,
      ),
      axisTitleData: _buildFlAxisTitleData(),
      //? 标题
      titlesData: _buildTitles(),
      //? 边框
      borderData: _buildBorderData(),
      minX: 0,
      maxX: 14,
      maxY: 6,
      minY: 0,
      //? 线条数据
      lineBarsData: linesBarDatas(),
    );
  }

  //? 标题配置
  FlAxisTitleData _buildFlAxisTitleData() {
    return FlAxisTitleData(
      leftTitle: AxisTitle(titleText: "侧轴标题", showTitle: showAxisLeftTitle),
      bottomTitle: AxisTitle(titleText: "底部标题", showTitle: showAxisBottomTitle),
    );
  }

  //? 坐标配置
  FlTitlesData _buildTitles() {
    return FlTitlesData(
      //? 下边标题
      bottomTitles: _buildBottomTitle(),
      //? 左侧标题
      leftTitles: _buildLeftTitle(),
    );
  }

  //? 底部坐标配置
  SideTitles _buildBottomTitle() {
    return SideTitles(
      showTitles: showBottomTitles,
      //? 标题下面空间，如果不预留，可能与下面控件重合
      reservedSize: 22,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff72719b),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      margin: 10,
      getTitles: (value) {
        switch (value.toInt()) {
          case 2:
            return 'SEPT';
          case 7:
            return 'OCT';
          case 12:
            return 'DEC';
        }
        return '';
      },
    );
  }

  //? 左侧坐标配置
  SideTitles _buildLeftTitle() {
    return SideTitles(
      showTitles: showlLeftTitles,
      interval: 2,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff75729e),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '1m';
          case 2:
            return '2m';
          case 3:
            return '3m';
          case 4:
            return '5m';
          case 5:
            return '6m';
        }
        return '';
      },
      margin: 8,
      reservedSize: 30,
    );
  }

  //? 边框信息
  FlBorderData _buildBorderData() {
    return FlBorderData(
        show: showBorderData,
        border: Border(
          bottom: showBottomBorder
              ? BorderSide(
                  color: Color(0xff4e4965),
                  width: 4,
                )
              : BorderSide(
                  color: Colors.transparent,
                ),
          left: showLeftBorder
              ? BorderSide(
                  color: Color(0xff4e4965),
                  width: 2,
                )
              : BorderSide(
                  color: Colors.transparent,
                ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ));
  }

  //? 三条线的配置
  List<LineChartBarData> linesBarDatas() {
    return [
      // 绿线
      LineChartBarData(
        //? 取样点
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        //? 是否是曲线
        isCurved: isCurved1,
        // curveSmoothness: 0,
        colors: const [
          Color(0x444af699),
        ],
        //? 线的宽度
        barWidth: 4,
        //? 线头是否是圆形
        isStrokeCapRound: true,
        //? 是否显示数据点
        dotData: FlDotData(
          show: false,
        ),
        //? 是否显示线上区域
        aboveBarData: BarAreaData(show: showAboveBarData, colors: [
          const Color(0x444af699),
        ]),
      ),
      // 粉线
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        isCurved: true,
        colors: const [
          Color(0x99aa4cfc),
        ],
        barWidth: 4,
        isStrokeCapRound: isStrokeCapRound,
        dotData: FlDotData(
          show: showDotData2,
        ),
        belowBarData: BarAreaData(show: showBelowBarData, colors: [
          const Color(0x33aa4cfc),
        ]),
      ),
      // 蓝线
      LineChartBarData(
        spots: [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x4427b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }
}
