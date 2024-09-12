import 'package:flutter/material.dart';
import 'package:tela_cadastro/models/user_model.dart';
import 'package:tela_cadastro/view/listar_users.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({super.key});

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
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


    setState(() {
      users.add(UserModel(
          nome: nomeController.text,
          email: emailController.text,
          telefone: telefoneController.text,
          endereco: enderecoController.text,
          sex: sex));

      nomeController.text = "";
      emailController.text = "";
      telefoneController.text = "";
      enderecoController.text = "";

      _isFemaleChecked = false;
      _isMaleChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Column(
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

                  if (nomeController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      telefoneController.text.isEmpty ||
                      enderecoController.text.isEmpty ||
                      !_isFemaleChecked && !_isMaleChecked) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Revise os dados!'),
                        action: SnackBarAction(
                          label: 'Fechar',
                          onPressed: () {
                            // Code to execute.
                          },
                        ),
                      ),
                    );
                  } else {
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
                  }
                },
                child: Text("Salvar")),
            ElevatedButton(
                onPressed: () {
                  // funcao
                  if (users.isEmpty) {
                    print("users teste" + users.length.toString());

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
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListarUsers(
                              users: users,
                            )));
                  }
                },
                child: Text("Ver Usuarios"))
          ],
        ),
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
            const Text('Masculino'),
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
            const Text('Feminino'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}