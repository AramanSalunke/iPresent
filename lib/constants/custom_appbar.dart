import 'package:flutter/material.dart';
//import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? child;
  final Function()? onPressed;
  final Function()? onTitleTapped;
  final String? buttonHeroTag;
  final String? titleHeroTag;

  @override
  final Size preferredSize;

  CustomAppBar({
    this.title,
    this.child,
    this.onPressed,
    this.buttonHeroTag = 'topBarBtn',
    this.onTitleTapped,
    this.titleHeroTag = "title",
  }) : preferredSize = Size.fromHeight(60.0);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: widget.buttonHeroTag!,
                child: Card(
                  color: Color(0xFFE7004C),
                  elevation: 10,
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height / 17,
                    minWidth: MediaQuery.of(context).size.width / 8.5,
                    onPressed: widget.onPressed,
                    child: widget.child,
                  ),
                ),
              ),
              Hero(
                tag: widget.titleHeroTag!,
                transitionOnUserGestures: true,
                child: Card(
                  color: Color(0xFFE7004C),
                  elevation: 10,
                  child: InkWell(
                    onTap: widget.onTitleTapped,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 17,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              widget.title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
