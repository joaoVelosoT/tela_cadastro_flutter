import 'package:flutter/material.dart';
import 'package:tela_cadastro/models/user_model.dart';

class ListarUsers extends StatelessWidget {
  const ListarUsers({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    //  mostrarUsers() {
      
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela de Cadastro"),
      ),
       body: 
       
       ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) { 
          final user = users[index];
          Icon iconSex;
          if(user.sex == "boy"){
            
            iconSex =  Icon(Icons.boy, color: Colors.blue,size: 100);
          }else {
            // iconSex = Icons.girl;
            iconSex =  Icon(Icons.girl, color: Colors.pink,size: 100);
          }
          return  
          SingleChildScrollView(child: Column(children: [
            Container(
            
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.black12)
              
            ),
            child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                   Column(
                    children: [
                      // Icon(iconSex,color: Colors.blue,size: 100,),
                      iconSex
                      // Icon(Icons.girl,color: Colors.blue,size: 100,)
                      
                      // iconSex
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Column(children: [
                      Text(user.nome),
                      Text(user.email),
                      Text(user.telefone),
                      Text(user.endereco)
                    ],),
                  )
                ],)
            ],),
          )
          ],),);
          

       })
      // Column(
      //   children: [
      //     ListView.builder(
      //       itemCount: users.length,
      //       itemBuilder: (context, index){
      //         final user = users[index];

      //         return  Column(children: [
      //           Row(children: [
      //             Text(user.nome)
      //           ],)
      //         ],
      //         );
            
      //         // final user = users[index];
      //         // return Text(user.nome);
      //       }
      //       )

          
      //   ],
      // ),
    );
  }
}
