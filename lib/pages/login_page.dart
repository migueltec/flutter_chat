import 'package:chat/widgets/blue_button.dart';
import 'package:chat/widgets/labels.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/logo.dart';

class LoginPage extends StatelessWidget{

    @override
    Widget build(BuildContext context){
        return Scaffold(
            backgroundColor: Color(0xFFF2F2F2),
            body: SafeArea(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Logo(),
                                _LoginFormWidget(),
                                Labels(
                                    subtitle: '¿No tienes cuenta?',
                                    title: '¡Crea una cuenta ahora!',
                                    path: 'register',
                                ),
                                Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w300))
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}

class _LoginFormWidget extends StatefulWidget{
    @override
    __LoginFormWidgetState createState() => __LoginFormWidgetState();
}

class __LoginFormWidgetState extends State<_LoginFormWidget> {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.symmetric(horizontal:50),
            child: Column(
                children: [
                    CustomInput(
                        hintText: 'Email',
                        icon: Icon( Icons.mail_outline ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                    ),
                    CustomInput(
                        hintText: 'Password',
                        icon: Icon( Icons.lock_outline ),
                        obscureText: true,
                        controller: passwordController,
                    ),
                    BlueButton(
                        text: 'Login',
                        onPressed: (){
                            print(emailController.text);
                            print('Hola mundo');
                        },
                    ),
                ],
            )
        );
    }
}