import 'package:flutter/material.dart';
import 'package:flutter_application_aula3/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;

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
          CustomTextField(hintText: 'Titulo', labelText: 'Digite o título'),
          CustomTextField(
            hintText: 'Descrição',
            labelText: 'Digite a descrição',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
