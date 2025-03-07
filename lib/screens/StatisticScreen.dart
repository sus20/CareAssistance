import 'package:flutter/material.dart';
import 'package:refresh/models/colorData.dart';
import 'package:fl_chart/fl_chart.dart';

const IconData meditation = Icons.self_improvement;
const IconData conversation = Icons.people;
const IconData move = Icons.accessibility_new;
const IconData sun = Icons.wb_sunny;

class StatisticScreen extends StatefulWidget {
  final String title = 'Deine Statistik';

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed('/homeScreen');
            },
          ),
          title: Text(widget.title),
        ),
        backgroundColor: ColorData.blueDark,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Dein Level',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(AssetImage("assets/crown_icon.png"),
                              size: 64, color: ColorData.yellow),
                          // size: 64, color: ColorData.yellowDark),
                          // Image(
                          //   image: AssetImage("assets/crown_icon.png"),
                          //   width: 64,
                          //   height: 64,
                          // ),
                          Text(
                            'STUFE 6',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: ColorData.yellow),
                            // color: ColorData.yellowDark),
                          ),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240,
                              child: LinearProgressIndicator(
                                value: 0.75,
                                minHeight: 7,
                                semanticsLabel: 'Linear progress indicator',
                                backgroundColor: Colors.white,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.green),
                              ),
                            ),
                            Text('Als nächstes kannst du freischalten:',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.circle,
                                        color: Colors.white, size: 10),
                                  ),
                                  TextSpan(
                                    text: " Tai-Chi",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.circle,
                                        color: Colors.white, size: 10),
                                  ),
                                  TextSpan(
                                      text: " Shiatsu",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ]),
                      ElevatedButton.icon(
                        icon: Icon(Icons.share_outlined, size: 25),
                        label: Text(
                          "Level teilen",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: ColorData.blueDark, elevation: 0.5),
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorData.yellow),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Statistik',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 5, right: 55, bottom: 5, top: 10),
                    child: LineChart(
                      LineChartData(
                          lineTouchData: LineTouchData(
                              enabled: true,
                              touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor: Colors.black)),
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                              getTitles: (value) {
                                if (value == 0) return '';
                                return value.toInt().toString();
                              },
                              margin: 12,
                            ),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                              getTitles: (value) {
                                return '0' +
                                    (value.toInt() + 1).toString() +
                                    '.05';
                              },
                              margin: 12,
                              rotateAngle: 35,
                            ),
                          ),
                          axisTitleData: FlAxisTitleData(
                              leftTitle: AxisTitle(
                                titleText: 'Punkte',
                                showTitle: true,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              bottomTitle: AxisTitle(
                                titleText: 'Tagen',
                                showTitle: true,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              show: true),
                          lineBarsData: [
                            LineChartBarData(colors: [
                              Colors.white
                            ], spots: [
                              FlSpot(0, 0),
                              FlSpot(1, 5),
                              FlSpot(2, 21),
                              FlSpot(3, 21),
                              FlSpot(4, 24),
                              FlSpot(5, 31),
                              FlSpot(6, 37),
                              FlSpot(7, 38),
                              FlSpot(8, 41)
                            ])
                          ] // read about it in the LineChartData section
                          ),
                      swapAnimationDuration:
                          Duration(milliseconds: 150), // Optional
                      swapAnimationCurve: Curves.linear, // Optional
                    ),
                  ),
                ),

                Divider(
                  color: ColorData.yellow,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Heute',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(AssetImage("assets/sleep.png"),
                          size: 88, color: ColorData.yellow),
                      // color: ColorData.yellowDark),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Keine Aktivität',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            '+ 0 Punkte',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            // color: ColorData.yellowDark),
                          ),
                        ],
                      )
                    ],
                  ),
                )
                // SizedBox(height: 5),
              ],
            ),
          ),
        ));
  }
}
