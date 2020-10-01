import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget{
    final String hintText;
    final Icon icon;
    final bool obscureText;
    final TextEditingController controller;
    final TextInputType keyboardType;

    const CustomInput({
        Key key,
        @required this.hintText,
        @required this.icon,
        @required this.controller,
        this.obscureText = false,
        this.keyboardType = TextInputType.text,
    }) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.only(top:5, left:5, bottom: 5, right: 20),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: Offset(0, 5),
                        blurRadius: 5
                    ),
                ]
            ),
            child: TextField(
                autocorrect: false,
                controller: controller,
                obscureText: this.obscureText,
                keyboardType: this.keyboardType,
                decoration: InputDecoration(
                    prefixIcon: this.icon,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: this.hintText
                ),
            )
        );
    }
}