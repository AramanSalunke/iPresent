import 'package:flutter/material.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/login/loadingSignUp.dart';
import 'package:ipresent/login/sign_Up.dart';
import 'package:ipresent/login/signinScreenWords.dart';
import 'package:ipresent/models/signin_model.dart';
import 'package:stacked/stacked.dart';

class SigninUserAndPassword extends StatefulWidget {
  final Color? backgroundColor;
  final String? logo;
  final Color? textColor;

  final bool? isFooter;
  final Widget? widgetFooter;

  final bool? isResetPassword;
  final Widget? widgetResetPassword;

  final bool? isSignUp;
  final Widget? signUp;

  final Function callLogin;
  final SigninScreenWords? signinScreenWords;

  const SigninUserAndPassword(
      {this.backgroundColor,
      this.logo,
      this.textColor,
      this.isFooter,
      this.widgetFooter,
      this.isResetPassword,
      this.widgetResetPassword,
      this.isSignUp,
      this.signUp,
      required this.callLogin,
      this.signinScreenWords});
  @override
  _SigninUserAndPasswordState createState() => _SigninUserAndPasswordState();
}

class _SigninUserAndPasswordState extends State<SigninUserAndPassword> {
  SigninModel signinModel = SigninModel();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  TextEditingController _textEditingControllerUser = TextEditingController();

  bool isNoVisiblePassword = true;
  bool isRequest = false;
  final focus = FocusNode();
  final bool isLoginRequest = false;
  SigninScreenWords? signinScreenWords;
  @override
  Widget build(BuildContext context) {
    signinScreenWords = (widget.signinScreenWords == null)
        ? SigninScreenWords()
        : widget.signinScreenWords;
    return ViewModelBuilder<SigninModel>.reactive(
        viewModelBuilder: () => SigninModel(),
        // onModelReady: (model) => model.getUserInfo(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                // iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: widget.backgroundColor ?? Color(0xFFE7004C),
                centerTitle: true,
                elevation: 0,
                title: Text(
                  this.signinScreenWords!.login,
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
                      height: MediaQuery.of(context).size.height * .7,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                          color: Color(0xFFF3F3F5),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(50.0),
                            topRight: const Radius.circular(50.0),
                          )),
                      child: buildBody(model),
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget buildBody(SigninModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 0,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    controller: this._textEditingControllerUser,
                    onChanged: model.setEmail,
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
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 18),
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
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 25, left: 20, right: 20, top: 20),
                child: TextFormField(
                    focusNode: focus,
                    controller: this._textEditingControllerPassword,
                    onChanged: model.setPassword,
                    obscureText: this.isNoVisiblePassword,
                    style: TextStyle(
                        color: widget.textColor ?? Color(0xFF0F2E48),
                        fontSize: 14),
                    onFieldSubmitted: (value) {
                      widget.callLogin(
                          context,
                          setIsRequest,
                          this._textEditingControllerUser.text,
                          this._textEditingControllerPassword.text);
                    },
                    //autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                        child: Image.asset(
                          "assets/icon_password.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
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
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 15.0, 8.0),
                                  child: Image.asset(
                                    "assets/icon_eye_close.png",
                                    // package: 'ipresent',
                                    width: 15,
                                    height: 15,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 15.0, 8.0),
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
                              BorderSide(width: 2.0, color: Colors.cyan),
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
                        model.login(context);
                        widget.callLogin(
                            context,
                            setIsRequest,
                            this._textEditingControllerPassword.text,
                            this._textEditingControllerUser.text);
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                this.signinScreenWords!.login,
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
              (widget.isResetPassword == null ||
                      widget.isResetPassword == false)
                  ? SizedBox()
                  : GestureDetector(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 10, right: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: '',
                                style: TextStyle(
                                    color:
                                        widget.textColor ?? Color(0xFF0F2E48),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15)),
                            TextSpan(
                                text: this.signinScreenWords!.recoverPassword,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color:
                                        widget.textColor ?? Color(0xFF0F2E48),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ]),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => widget.widgetResetPassword!,
                        ));
                      },
                    ),
              GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: this.signinScreenWords!.notAccount + '\n',
                          style: TextStyle(
                              color: widget.textColor ?? Color(0xFF0F2E48),
                              fontWeight: FontWeight.normal,
                              fontSize: 15)),
                      TextSpan(
                          text: this.signinScreenWords!.signUp,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: widget.textColor ?? Color(0xFF0F2E48),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ]),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_buildContest) => SignUp(
                            logo: 'assets/logo_header.png',
                            widgetFooter: widgetFooter(),
                          )));
                },
              )
            ],
          ),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: widget.widgetFooter,
        ),
      ],
    );
  }

  Widget widgetFooter() {
    return SigninScreenFooter(
      logo: 'assets/logo_footer.png',
      text: 'Powered by',
      funFooterLogin: () {},
    );
  }

  void setIsRequest(bool isRequest) {
    setState(() {
      this.isRequest = isRequest;
    });
  }
}
