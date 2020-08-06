import 'package:caixa_relayout/ui/components/login_body.dart';
import 'package:caixa_relayout/ui/components/login_header.dart';
import 'package:caixa_relayout/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isPersonalAccount = useState<bool>(true);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
              child: SingleChildScrollView(
          child: Column(children: <Widget>[
            LoginHeader(accountNotifier: isPersonalAccount),
            LoginBody(isPersonalAccount: isPersonalAccount.value,),
          ]),
        ),
      ),
    );
  }
}
