import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: InkWell(radius: 30,
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
              child: Icon(
                size: 32,
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            width: 27.5,
            height: 10.5,
            child: Container(
              width: 7.5,
              height: 7.5,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(100),
                shape: BoxShape.circle,
                color: Color(0XFFFF8A00),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
