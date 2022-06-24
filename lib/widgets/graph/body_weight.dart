// import 'package:flutter/material.dart';
// import 'common widgets/bottom_bar.dart';
// import 'common widgets/single_tile_graph.dart';
// import 'common widgets/top_bar.dart';

// class BodyWeight extends StatefulWidget {
//   const BodyWeight({Key key}) : super(key: key);

//   @override
//   BodyWeightState createState() => BodyWeightState();
// }

// class BodyWeightState extends State<BodyWeight> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4.00),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             const TopBar(title: 'Body weight comparison'),
//             const SizedBox(
//               height: 10.0,
//             ),
//             SingleTileGraph(
//                 maximum: 120,
//                 minimum: 0,
//                 interval: 20,
//                 mon: 50,
//                 tue: 51,
//                 wed: 55,
//                 thu: 52,
//                 fri: 52,
//                 sat: 50,
//                 sun: 55),
//             const BottomBar(text1: 'Normal', text2: 'Over Weight'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ignore: unused_element
// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }
