import 'package:chat/widgets/blue_button.dart';
import 'package:chat/widgets/labels.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/logo.dart';

class RegisterPage extends StatelessWidget{

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
                                Logo(title: 'Registro'),
                                _RegisterFormWidget(),
                                Labels(
                                    subtitle: '¿Ya tienes una cuenta?',
                                    title: '¡Ingresa ahora!',
                                    path: 'login',
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

class _RegisterFormWidget extends StatefulWidget{
    @override
    __RegisterFormWidgetState createState() => __RegisterFormWidgetState();
}

class __RegisterFormWidgetState extends State<_RegisterFormWidget> {
    final nameController     = TextEditingController();
    final emailController    = TextEditingController();
    final passwordController = TextEditingController();

    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.symmetric(horizontal:50),
            child: Column(
                children: [
                    CustomInput(
                        hintText: 'Name',
                        icon: Icon( Icons.perm_identity ),
                        keyboardType: TextInputType.emailAddress,
                        controller: nameController,
                    ),
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
                        text: 'Register',
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