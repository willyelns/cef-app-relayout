import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../utils.dart';

class LoginHeader extends HookWidget {
  const LoginHeader({
    Key key,
    @required this.accountNotifier,
  }) : super(key: key);

  final ValueNotifier<bool> accountNotifier;

  @override
  Widget build(BuildContext context) {
    final isPersonalAccount = useState<bool>(true);

    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(color: kPrimaryColor),
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2, vertical: kPadding),
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: 'INTERNET'),
                        TextSpan(
                          text: ' BANKING',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                Spacer(),
                Image.asset(
                  'lib/assets/images/logo.png',
                  width: 185,
                  height: 43,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  // ! Add animation in text button
                  buildAccountTypeButton(text: 'Pessoa física', selected: accountNotifier.value, onPressed: () => accountNotifier.value = true),
                  Spacer(),
                  buildAccountTypeButton(text: 'Pessoa jurídica', selected: !accountNotifier.value, onPressed: () => accountNotifier.value = false),
                ]),
              ],
            ),
          ),
          Positioned(
            right: kPadding,
            top: 0,
            child: IconButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  RaisedButton buildAccountTypeButton({String text, OnPressed onPressed, bool selected = false}) {
    return RaisedButton(
                    color: selected ? Colors.white : Color(0xFFF9F9F9),
                    splashColor: kPrimaryColor.withOpacity(0.4),
                    focusColor: kPrimaryColor.withOpacity(0.3),
                    highlightColor: kPrimaryColor.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kPadding * 1.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding * 0.5, vertical: kPadding),
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 150),
                        style: TextStyle(color: selected ? kPrimaryColor : kTextColor, fontWeight: selected ? FontWeight.bold : FontWeight.normal,),
                        child: Text(
                        text.toUpperCase(),
                      ),),
                    ),
                    onPressed: onPressed);
  }
}
