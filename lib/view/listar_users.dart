import 'package:flutter/material.dart';
import 'package:tela_cadastro/models/user_model.dart';

class ListarUsers extends StatelessWidget {
  const ListarUsers({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
     mostrarUsers() {
      
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Cadastro"),
      ),
      body:  Column(
        children: [
          ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              Column(children: [
                Text(users[index].nome)
              ],);
            }
            )

          // Text(users[1].nome)
        ],
      ),
    );
  }
}
