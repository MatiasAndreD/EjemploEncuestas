import 'package:flutter/material.dart';
import 'package:prueba_formgoogle_app/global/app_global.dart';

class CustomCard extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double padding;
  final double top;
  final double bottom;
  final Widget child;
  final Function onTap;
  final bool shadow;
  CustomCard({
    Key key,
    this.width = 150,
    this.height,
    this.color = AppGlobals.whiteColor,
    this.padding = 16.0,
    this.top,
    this.bottom,
    this.onTap,
    this.shadow = true,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: this.shadow ? [AppGlobals.boxShadow] : null,
        borderRadius: customBorders(),
        color: this.color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onTap,
          borderRadius: customBorders(),
          splashColor: AppGlobals.lightColor,
          child: Container(
            width: this.width,
            height: this.height != null ? this.height : null,
            padding: EdgeInsets.all(
              this.padding,
            ),
            child: Container(child: this.child),
          ),
        ),
      ),
    );
  }

  BorderRadius customBorders() {
    return this.top == null && this.bottom == null
        ? BorderRadius.circular(
            24.0,
          )
        : this.bottom == null && this.top != null
            ? BorderRadius.only(
                topLeft: Radius.circular(
                  this.top,
                ),
                topRight: Radius.circular(
                  this.top,
                ),
              )
            : this.bottom != null && this.top == null
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(
                      this.top,
                    ),
                    bottomRight: Radius.circular(
                      this.top,
                    ),
                  )
                : BorderRadius.circular(
                    this.top,
                  );
  }
}

class CustomCaption extends StatelessWidget {
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;
  final Color color;

  CustomCaption(
      {Key key,
      @required this.child,
      this.verticalPadding,
      this.horizontalPadding,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            this.horizontalPadding != null ? this.horizontalPadding : 16.0,
        vertical: this.verticalPadding != null ? this.verticalPadding : 8.0,
      ),
      decoration: BoxDecoration(
        color: this.color != null
            ? this.color
            : AppGlobals.redColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: this.child,
    );
  }
}
