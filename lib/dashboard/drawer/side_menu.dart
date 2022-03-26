import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipresent/app/locator.dart';
import 'package:ipresent/core/enums/services/firebase_services/auth_services.dart';
import 'package:ipresent/login/footer_Signin.dart';
import 'package:ipresent/splash_Screen/login_Screen.dart';
import 'package:ipresent/util/dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);
  DialogService _dialogService = locator<DialogService>();
  AuthServices _authServices = locator<AuthServices>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/mlogo.png"),
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Privacy Policy",
              svgSrc: "assets/icons/pripol.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Contact Us",
              svgSrc: "assets/icons/contact.svg",
              press: () {},
            ),
            // DrawerListTile(
            //   title: "Documents",
            //   svgSrc: "assets/icons/menu_doc.svg",
            //   press: () {},
            // ),
            // DrawerListTile(
            //   title: "Store",
            //   svgSrc: "assets/icons/menu_store.svg",
            //   press: () {},
            // ),
            DrawerListTile(
              title: "LogOut",
              svgSrc: "assets/icons/logout.svg",
              press: () {
                logOut(context);
              },
            ),
            // DrawerListTile(
            //   title: "Profile",
            //   svgSrc: "assets/icons/menu_profile.svg",
            //   press: () {},
            // ),
            DrawerListTile(
              title: "Version  1.0.1",
              svgSrc: "assets/icons/version.svg",
              press: () {},
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: this.widgetFooter(),
        ),
      ),
    ]);
  }

  logOut(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Do you want to LogOut?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
              ElevatedButton(
                  onPressed: () {
                    _authServices.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_buildContest) => LoginScreen()));
                  },
                  child: Text("Yes")),
            ],
          );
        });
  }

  Widget widgetFooter() {
    return SigninScreenFooter(
      logo: 'assets/logo_footer.png',
      text: 'Powered by',
      funFooterLogin: () {},
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        //  color: Colors.white54,
        height: 20,
      ),
      title: Text(
        title,
        //style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
