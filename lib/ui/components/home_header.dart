import 'package:flutter/material.dart';

import '../utils.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.22,
        color: kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: kPadding * 2, vertical: kPadding),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Row(children: <Widget>[
                Spacer(),
                //! Widget dropdown
                Row(children: <Widget>[
                  Text('Conta Poupança', style: TextStyle(color: Colors.white, fontSize: 16),),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ]),
                Spacer(),
                //! Notification Button
              ]),
              Positioned(
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('lib/assets/images/avatar.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(width: 10, height: 10, decoration: BoxDecoration(color: Color(0xFF6AE40A), borderRadius: BorderRadius.circular(5),),),)
                  ],
                ),
              ),
              Positioned(
                top: -kPadding,
                right: 0,
                child: IconButton(icon: Icon(Icons.notifications_none, color: Colors.white,), onPressed: (){},),),
            ],
          ),
        ),);
  }
}
