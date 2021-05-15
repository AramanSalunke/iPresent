import 'package:flutter/material.dart';

class SigninScreenFooter extends StatelessWidget {
  final String? text;
  final String? logo;

  final Color? textColor;

  final Function()? funFooterLogin;

  SigninScreenFooter({
    this.text,
    this.logo,
    this.textColor,
    this.funFooterLogin,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: this.funFooterLogin,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    this.text! + '  ',
                    style: TextStyle(
                      color: this.textColor ?? Color(0xFF0F2E48),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Image.asset(
                this.logo!,
                width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
