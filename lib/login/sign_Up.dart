import 'package:flutter/material.dart';
import 'package:ipresent/login/SigninScreenWords.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/login/resetPassword.dart';
import 'package:ipresent/login/sign_In.dart';
import 'package:ipresent/models/sign_Up_model.dart';
import 'package:ipresent/login/loadingSignUp.dart';

import 'package:stacked/stacked.dart';

class SignUp extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final SigninScreenWords? signinScreenWords;
  final Function? funSignUp;
  final bool? isFooter;
  final Widget? widgetFooter;
  final String? logo;
  //final bool isRequest;
  SignUp({
    this.backgroundColor,
    this.textColor,
    this.signinScreenWords,
    this.funSignUp,
    this.isFooter,
    this.widgetFooter,
    this.logo,
  });
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpModel signUpModel = SignUpModel();
  bool isRequest = false;
  bool isNoVisiblePassword = true;
  SigninScreenWords? signinScreenWords;
  @override
  Widget build(BuildContext context) {
    signinScreenWords = (widget.signinScreenWords == null)
        ? SigninScreenWords()
        : widget.signinScreenWords;
    return ViewModelBuilder<SignUpModel>.reactive(
        viewModelBuilder: () => SignUpModel(),
        // onModelReady: (model) => model.getUserInfo(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: widget.backgroundColor ?? Color(0xFFE7004C),
                centerTitle: true,
                elevation: 0,
                title: Text(
                  this.signinScreenWords!.signUp,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
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
                              ),
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
                      child: buildBody(model),
                    ),
                  )
                ],
              ),
            ));
  }

  Widget buildBody(SignUpModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, left: 20, right: 20, top: 20),
                child: TextFormField(
                    onChanged: model.getEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: widget.textColor ?? Color(0xFF0F2E48),
                        fontSize: 14),
                    // autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: this.signinScreenWords!.hintLoginUser,
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 18),
                      isDense: false,
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderSide:
                              BorderSide(width: 2, color: Colors.teal[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 1.0,
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFAAB5C3)),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      disabledBorder: InputBorder.none,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, left: 20, right: 20, top: 20),
                child: TextFormField(
                    onChanged: model.getName,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: widget.textColor ?? Color(0xFF0F2E48),
                        fontSize: 14),
                    //autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: this.signinScreenWords!.hintName,
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 18),
                      isDense: false,
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderSide:
                              BorderSide(width: 2, color: Colors.teal[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 1.0,
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFAAB5C3)),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      disabledBorder: InputBorder.none,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, left: 20, right: 20, top: 20),
                child: TextFormField(
                    onChanged: model.getsurName,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: widget.textColor ?? Color(0xFF0F2E48),
                        fontSize: 14),
                    //autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: this.signinScreenWords!.hintSurname,
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 18),
                      isDense: false,
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderSide:
                              BorderSide(width: 2, color: Colors.teal[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 1.0,
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFAAB5C3)),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      disabledBorder: InputBorder.none,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, left: 20, right: 20, top: 20),
                child: TextFormField(
                    onChanged: model.getPassword,
                    obscureText: this.isNoVisiblePassword,
                    style: TextStyle(
                        color: widget.textColor ?? Color(0xFF0F2E48),
                        fontSize: 14),
                    //autofocus: false,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (this.isNoVisiblePassword)
                                this.isNoVisiblePassword = false;
                              else
                                this.isNoVisiblePassword = true;
                            });
                          },
                          child: (this.isNoVisiblePassword)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/icon_eye_close.png",
                                    // package: 'ipresent',
                                    width: 15,
                                    height: 15,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icon_eye_open.png",
                                      //package: 'ipresent',
                                      width: 15,
                                      height: 15),
                                )),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: this.signinScreenWords!.hintLoginPassword,
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 18),
                      isDense: false,
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 1.0,
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFAAB5C3)),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      disabledBorder: InputBorder.none,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, left: 20, right: 20, top: 20),
                child: TextFormField(
                    onChanged: model.getRepeatPassword,
                    obscureText: this.isNoVisiblePassword,
                    style: TextStyle(
                        color: widget.textColor ?? Color(0xFF0F2E48),
                        fontSize: 14),
                    //autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText:
                          this.signinScreenWords!.hintSignUpRepeatPassword,
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 18),
                      isDense: false,
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.teal[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 1.0,
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFAAB5C3)),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      disabledBorder: InputBorder.none,
                    )),
              ),
            ],
          ),
        )),
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
                  model.register(context);
                  if (model.getIsSuccess == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widgetSigninUserPassword()),
                    );
                  }
                  // widget.funSignUp!(
                  //   context,
                  //   setIsRequest,
                  // );
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: widget.backgroundColor ?? Color(0xFFE7004C),
                    child: Center(
                      child: Text(
                        this.signinScreenWords!.signUp,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
        widget.widgetFooter!
      ],
    );
  }

  Widget widgetSigninUserPassword() {
    return SigninUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);
        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      logo: 'assets/logo_header.png',
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetSigninScreenSignUP(),
    );
  }

  Widget widgetFooter() {
    return SigninScreenFooter(
      logo: 'assets/logo_footer.png',
      text: 'Powered by',
      funFooterLogin: () {},
    );
  }

  Widget widgetSigninScreenSignUP() {
    return SignUp(
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      // logo: 'assets/logo_header.png',
      funSignUp:
          (BuildContext _context, Function isRequest, SignUpModel signUpModel) {
        isRequest(true);
        print(signUpModel.email);
        print(signUpModel.password);
        print(signUpModel.repeatPassword);
        print(signUpModel.surname);
        print(signUpModel.name);

        isRequest(false);
      },
    );
  }

  Widget widgetResetPassword() {
    return ResetPassword(
      logo: 'assets/logo_header.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);
        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
    );
  }

  void setIsRequest(bool isRequest) {
    setState(() {
      this.isRequest = isRequest;
    });
  }
}
