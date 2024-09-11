import 'package:flutter/material.dart';
import 'package:tela_cadastro/models/user_model.dart';
import 'package:tela_cadastro/view/listar_users.dart';

class TelaDeCadastro extends StatelessWidget {
  const TelaDeCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [];

    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();
    TextEditingController enderecoController = TextEditingController();

    void salvarInfo() {
      if (_isFemaleChecked) {
        sex = "girl";
      } else if (_isMaleChecked) {
        sex = "boy";
      } 

      users.add(UserModel(
          nome: nomeController.text,
          email: emailController.text,
          telefone: telefoneController.text,
          endereco: enderecoController.text,
          sex: sex));
  print(nomeController.text);
      print(emailController.text);
      print(telefoneController.text);
      print(enderecoController.text);
      print(sex);
          nomeController.text = "";
          emailController.text = "";
          telefoneController.text = "";
          enderecoController.text = "";
          _isFemaleChecked = false;
          _isMaleChecked = false;
      
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Cadastro"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                  label: Center(child: Text("Nome")),
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  label: Center(child: Text("Email")),
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              controller: telefoneController,
              decoration: const InputDecoration(
                  label: Center(child: Text("Telefone")),
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              controller: enderecoController,
              decoration: const InputDecoration(
                  label: Center(child: Text("Endereço")),
                  border: OutlineInputBorder()),
            ),
          ),
          GenderCheckboxes(),
          ElevatedButton(
              onPressed: () {
                // funcao de salvar
                salvarInfo();
                 ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Salvo com sucesso!'),
                          action: SnackBarAction(
                            label: 'Fechar',
                            onPressed: () {
                              // Code to execute.
                            },
                          ),
                        ),
                      );
              },
              child: Text("Salvar")),
          ElevatedButton(
              onPressed: () {
                // funcao
                if(users.isEmpty){
                   ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Adicione um primeiro!'),
                          action: SnackBarAction(
                            label: 'Fechar',
                            onPressed: () {
                              // Code to execute.
                            },
                          ),
                        ),
                      );
                }else {
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListarUsers(users: users,)
                ));
                }
                
              },
              child: Text("Ver Usuarios"))
        ],
      ),
    );
  }
}

String sex = "null";
bool _isMaleChecked = false;
bool _isFemaleChecked = false;

class GenderCheckboxes extends StatefulWidget {
  @override
  _GenderCheckboxesState createState() => _GenderCheckboxesState();
}

class _GenderCheckboxesState extends State<GenderCheckboxes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: _isMaleChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isMaleChecked = value ?? false;
                  // Garantir que apenas um checkbox pode ser selecionado por vez
                  if (_isMaleChecked) {
                    _isFemaleChecked = false;
                    
                  }
                });
              },
            ),
            Text('Masculino'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              
              value: _isFemaleChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isFemaleChecked = value ?? false;
                  // Garantir que apenas um checkbox pode ser selecionado por vez
                  if (_isFemaleChecked) {
                    _isMaleChecked = false;
                   
                  }
                });
              },
            ),
            Text('Feminino'),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
