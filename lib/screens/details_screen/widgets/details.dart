import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfbauth/components/rounded_icon_btn.dart';
import 'package:flutterfbauth/models/models.dart';

import '../../../constants.dart';

// class Details extends StatelessWidget {
// final MGrocery item;

// const Details({
//   Key key,
//   this.item,
// }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var num = '1';
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 item.name,
//                 style: kTitleStyle.copyWith(fontSize: 18),
//               ),
//               /*SvgPicture.asset(
//                 'assets/icons/favorite.svg',
//                 color: kBlackColor.withOpacity(0.7),
//               ),*/
//             ],
//           ),
//           SizedBox(height: 10),
//           Text(
//             item.description,
//             style: kDescriptionStyle,
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: [
//               // Icon(
//               //   Icons.horizontal_rule,
//               //   color: kBlackColor.withOpacity(0.7),
//               // ),
//               RoundedIconBtn(
//                 icon: Icons.remove,
//                 press: () {},
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: kBorderColor),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   num,
//                   style: kTitleStyle,
//                 ),
//               ),
//               RoundedIconBtn(
//                 icon: Icons.add,
//                 showShadow: true,
//                 press: () {
//                   int addnum = int.parse(num) + 1;
//                   print("addnum${addnum}");
//                   num = addnum.toString();

//                 },
//               ),
//               Spacer(),
//               Text('\$${item.price}', style: kTitleStyle.copyWith(fontSize: 18))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
class Details extends StatefulWidget {
  final MGrocery item;

  const Details({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

int _counter = 1;

class _DetailsState extends State<Details> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.item.name,
                style: kTitleStyle.copyWith(fontSize: 18),
              ),
              /*SvgPicture.asset(
                'assets/icons/favorite.svg',
                color: kBlackColor.withOpacity(0.7),
              ),*/
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.item.description,
            style: kDescriptionStyle,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              // Icon(
              //   Icons.horizontal_rule,
              //   color: kBlackColor.withOpacity(0.7),
              // ),
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {
                  _decreaseCounter();
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$_counter',
                  style: kTitleStyle,
                ),
              ),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  _incrementCounter();
                },
              ),
              Spacer(),
              Text('\$${widget.item.price}',
                  style: kTitleStyle.copyWith(fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }
}

getCounter() {
  return _counter;
}

setCountertoone() {
  _counter = 1;
}
