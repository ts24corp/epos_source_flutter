import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    @required this.onPressed,
    @required this.title,
    this.colorButton,
    this.padding,
    this.fontSize,
    this.paddingContainer,
    this.colorText,
    this.textStyle,
  });

  final GestureTapCallback onPressed;
  final String title;
  final Color colorButton;
  final Color colorText;
  final double padding;
  final double fontSize;
  final EdgeInsets paddingContainer;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: paddingContainer ?? null,
      child: SizedBox(
        width: size.width,
        height: isPortrait == true ? size.width / 10 : size.width / 20,
        child: RaisedButton(
          padding: padding ?? EdgeInsets.all(0),
          child: Text(
            title,
            style: textStyle == null
                ? TextStyle(
                    color: Colors.white, fontSize: SizeConfig.setSize(20))
                : textStyle,
          ),
          color: colorButton ?? Colors.blue,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
