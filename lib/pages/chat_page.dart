import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
    @override
    _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
    final _textController = TextEditingController();
    final _focusNode = FocusNode();
    bool _isTyping = false;

    List<ChatMessage> _messages = [];

    @override
    void dispose() {
        for (ChatMessage msg in _messages){
            msg.animationController.dispose();
        }
        super.dispose();
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                elevation: 1,
                backgroundColor: Colors.white,
                title: Column(
                    children: [
                        CircleAvatar(
                            child: Text(
                                'Mi',
                                style:TextStyle(fontSize:12)
                            ),
                            backgroundColor: Colors.blue[100],
                            maxRadius: 14,
                        ),
                        SizedBox(height:3),
                        Text(
                            'Miguel Tec',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12
                            )
                        ),
                    ],
                ),
            ),
            body: Container(
                child: Column(
                    children: [
                        Flexible(
                            child: ListView.builder(
                                reverse: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (_, i)=>_messages[i],
                                itemCount: _messages.length,
                            ),
                        ),
                        Divider(height:1),
                        Container(
                            color: Colors.white,
                            child: _inputChat(),
                        ),
                    ],
                )
            ),
        );
    }

    Widget _inputChat(){
        return SafeArea(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal:8),
                child: Row(
                    children: [
                        Flexible(
                            child: TextField(
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Type a message',
                                ),
                                focusNode: _focusNode,
                                controller: _textController,
                                onChanged: (String text){
                                    setState(() {
                                        _isTyping = ( text.trim().length > 0);
                                    });
                                },
                                onSubmitted: _handleSubmit,
                            ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal:4.0),
                            child: Platform.isIOS ?
                                CupertinoButton(
                                    child: Text('Send'),
                                    onPressed: _isTyping ? ()=>_handleSubmit(_textController.text) : null,
                                ) :
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal:4.0),
                                    child: IconButton(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        icon: Icon(Icons.send),
                                        color: Colors.blue[400],
                                        onPressed: _isTyping ? ()=>_handleSubmit(_textController.text) : null,
                                    ),
                                ),
                        ),
                    ],
                ),
            )
        );
    }

    _handleSubmit(String text){
        if ( text.trim().length == 0 ) return;
        _textController.clear();
        _focusNode.requestFocus();

        final newMessage = ChatMessage(
            uid: '123',
            text:text,
            animationController: AnimationController(vsync:this, duration:Duration(milliseconds:200)),
        );
        _messages.insert(0, newMessage);
        newMessage.animationController.forward();

        setState(() {
            _isTyping = false;
        });
    }
}