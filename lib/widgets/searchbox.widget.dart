import 'package:flutter/material.dart';
import 'animated.input.widget.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool menuOpened = false;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AnimatedInput(
          controller: _controller,
        ),
        FlatButton(
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            semanticLabel: 'Open Menu',
          ),
          onPressed: () {
            !menuOpened ? _controller.forward() : _controller.reverse();
            menuOpened = !menuOpened;
          },
        )
      ],
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       padding: EdgeInsets.only(
//         left: 20,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.1),
//         borderRadius: BorderRadius.all(
//           Radius.circular(128),
//         ),
//       ),
//       child: Row(
//         children: <Widget>[
//           Icon(Icons.search),
//           Container(
//             width: 300,
//             padding: EdgeInsets.only(
//               left: 10,
//             ),
//             child: TextFormField(
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 labelText: "Search...",
//                 labelStyle: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 16,
//                 ),
//               ),
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Theme.of(context).primaryColor,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
