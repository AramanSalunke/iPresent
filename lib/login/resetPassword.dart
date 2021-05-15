import 'package:flutter/material.dart';
import 'package:ipresent/login/loadingSignUp.dart';
import 'package:ipresent/login/signinScreenWords.dart';

class ResetPassword extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final SigninScreenWords? signinScreenWords;
  final String? logo;
  final Function funResetPassword;
  final isFooter;
  final Widget? widgetFooter;

  const ResetPassword(
      {this.backgroundColor,
      this.textColor,
      this.signinScreenWords,
      this.logo,
      required this.funResetPassword,
      this.isFooter,
      this.widgetFooter});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _textEditingControllerUser = TextEditingController();
  bool isRequest = false;
  final focus = FocusNode();
  SigninScreenWords? signinScreenWords;
  @override
  Widget build(BuildContext context) {
    signinScreenWords = (widget.signinScreenWords == null)
        ? SigninScreenWords()
        : widget.signinScreenWords;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: widget.backgroundColor ?? Color(0xFFE7004C),
        centerTitle: true,
        elevation: 0,
        title: Text(
          this.signinScreenWords!.recoverPassword,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              color: widget.backgroundColor ?? Color(0xFFE7004C),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 3),
                        child: Hero(
                          tag: 'hero-login',
                          child: Image.asset(
                            widget.logo!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: Color(0xFFF3F3F5),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    )),
                child: buildBody(),
              )),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                signinScreenWords!.messageRecoverPassword,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: widget.textColor ?? Color(0xFF0F2E48), fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                  controller: this._textEditingControllerUser,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: widget.textColor ?? Color(0xFF0F2E48),
                      fontSize: 14),
                  // autofocus: false,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: this.signinScreenWords!.hintLoginUser,
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 18),
                    isDense: false,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                      child: Image.asset(
                        "assets/icon_user.png",
                        width: 15,
                        height: 15,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderSide: BorderSide(width: 2, color: Colors.cyan),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    enabledBorder: OutlineInputBorder(
                        gapPadding: 1.0,
                        borderSide:
                            BorderSide(width: 1.0, color: Color(0xFFAAB5C3)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    disabledBorder: InputBorder.none,
                  )),
            ),
            (this.isRequest)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoadingSignUp(
                      textLoading: this.signinScreenWords!.textLoading,
                      colorText: widget.textColor,
                      backgroundColor: widget.backgroundColor,
                      elevation: 0,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      widget.funResetPassword(context, this.setIsRequest,
                          this._textEditingControllerUser.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: widget.backgroundColor ?? Color(0xFFE7004C),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                this.signinScreenWords!.recoverPassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
        SizedBox(),
        // (widget.isFooter == null || widget.isFooter! == false)
        //     ? SizedBox()
        //:
        widget.widgetFooter!
      ],
    );
  }

  void setIsRequest(bool isRequest) {
    setState(() {
      this.isRequest = isRequest;
    });
  }
}
