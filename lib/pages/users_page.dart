import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/models/users_model.dart';

class UsersPage extends StatefulWidget{
    @override
    _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
    RefreshController _refreshController = RefreshController(initialRefresh: false);

    final listUsers = [
        UserModel(uid:'1', online:true, name:'Mike', email:'user@domain.com'),
        UserModel(uid:'2', online:false, name:'Sunny', email:'user@domain.com'),
        UserModel(uid:'1', online:false, name:'Axel', email:'user@domain.com'),
    ];
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    'Mi nombre',
                    style: TextStyle(
                        color: Colors.black87
                    ),
                ),
                backgroundColor: Colors.white,
                elevation: 1,
                leading: IconButton(
                    icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                    ),
                    onPressed: (){
                    }
                ),
                actions: [
                    Container(
                        margin: EdgeInsets.only(right:10),
                        child: Icon(
                            Icons.check_circle,
                            color: Colors.blue[400],
                        ),
                    ),
                ],
            ),
            body: SmartRefresher(
                controller: _refreshController,
                onRefresh: _loadUsers,
                header: WaterDropHeader(
                    complete: Icon(Icons.check, color:Colors.blue[400]),
                    waterDropColor: Colors.blue[400],
                ),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, i)=>_userItemTile(listUsers[i]),
                    separatorBuilder: (_, i)=>Divider(),
                    itemCount: listUsers.length
                ),
            ),
        );
    }

    ListTile _userItemTile(UserModel user) {
        return ListTile(
            title: Text(user.name),
            leading: CircleAvatar(
                child: Text(user.name.substring(0,2)),
                backgroundColor: Colors.blue[100],
            ),
            trailing: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: user.online ? Colors.green[300] : Colors.redAccent,
                    borderRadius: BorderRadius.circular(100),
                ),
            ),
        );
    }

    _loadUsers() async{
        await Future.delayed(Duration(milliseconds: 1000));
        _refreshController.refreshCompleted();
    }
}