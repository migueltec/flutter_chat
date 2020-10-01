import 'dart:ui';

import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget{
    final Function onPressed;
    final String text;

    const BlueButton({
        Key key,
        @required this.onPressed,
        @required this.text
    }) : super(key: key);

    @override
    Widget build(BuildContext context){
        return RaisedButton(
            elevation: 2,
            highlightElevation: 5,
            shape: StadiumBorder(),
            color: Colors.blue,
            child: Container(
                height: 45,
                width: double.infinity,
                child: Center(
                    child: Text(
                        this.text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                    ),
                ),
            ),
            onPressed: this.onPressed
        );
    }
}