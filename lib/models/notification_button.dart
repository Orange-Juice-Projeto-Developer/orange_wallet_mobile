import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 5, right: 5),
      width: 30,
      height: 30,
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              size: 32,
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(100),
              shape: BoxShape.circle,
              color:  Color(0XFFFF8A00),
            ),
          ),
        ],
      ),
    );
  }
}
