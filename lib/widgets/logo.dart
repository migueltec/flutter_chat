import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
    final String title;

    const Logo({
        Key key,
        this.title = 'Messenger'
    }) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Center(
            child: Container(
                child: Column(
                    children: [
                        Image(image: AssetImage('assets/logo.png'), height:150),
                        Text(this.title, style: TextStyle(fontSize: 30)),
                    ],
                ),
            ),
        );
    }
}