import 'package:flutter/material.dart';
import 'package:flutter_application_aula3/widgets/custom_text_field.dart';
import 'package:flutter_application_aula3/app/model/tarefa_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  List<TarefaModel> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF07400),
        title: Text('Lista de Tarefas'),
        centerTitle: true,
        actions: [Icon(Icons.share)],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Luis'),
              accountEmail: Text('felipe_souza91@live.com'),
              decoration: BoxDecoration(color: Color(0xFFF07400)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://fastly.picsum.photos/id/24/4855/1803.jpg?hmac=ICVhP1pUXDLXaTkgwDJinSUS59UWalMxf4SOIWb9Ui4',
                ),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4',
                  ),
                ),
              ],
            ),
            Text(
              'Departamentos',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Tauste Supermercados'),
              subtitle: Text('Bem-vindo ao Tauste!'),
              trailing: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
              tileColor: Colors.indigo[900],
              textColor: Colors.white,
              onTap:
                  () => showDialog(
                    context: context,
                    builder:
                        (BuildContext context) => AlertDialog(
                          title: Text('Ótima escolha!'),
                          content: Text('Faz toda diferença!!!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Fechar'),
                            ),
                          ],
                        ),
                  ),
            ),
            ListTile(
              title: Text('Concorrencia'),
              subtitle: Text('Bem-vindo a concorrencia!'),
              tileColor: Colors.green,
              textColor: Colors.white,
              onTap:
                  () => showDatePicker(
                    context: context,
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2025),
                  ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CustomTextField(
            hintText: 'Titulo',
            labelText: 'Digite o título',
            controller: tituloController,
          ),
          CustomTextField(
            hintText: 'Descrição',
            labelText: 'Digite a descrição',
            controller: descricaoController,
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = TarefaModel(
                  titulo: tarefas[index].titulo,
                  descricao: tarefas[index].descricao,
                );

                return Dismissible(
                  key: Key(tarefa.titulo + index.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                  onDismissed: (direction) {
                    _removeTarefa(index);
                  },
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                    title: Text(tarefas[index].titulo),
                    subtitle: Text(tarefas[index].descricao),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTarefa,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTarefa() {
    if (!tituloController.text.isEmpty && !descricaoController.text.isEmpty) {
      setState(() {
        tarefas.add(
          TarefaModel(
            titulo: tituloController.text,
            descricao: descricaoController.text,
          ),
        );
      });
      tituloController.clear();
      descricaoController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Voce Precisa preencher os campos')),
      );
    }
  }

  void _removeTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }
}
