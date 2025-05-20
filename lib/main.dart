import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD G4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      home: const CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final List<Time> times = [];
  final List<Torcedor> torcedores = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Se cadastre!')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => CadastroTimeScreen(
                            times: times,
                            torcedores: torcedores,
                          ),
                    ),
                  );
                },
                child: const Text('Cadastrar Time'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => CadastroTorcedorScreen(
                            times: times,
                            torcedores: torcedores,
                          ),
                    ),
                  );
                },
                child: const Text('Cadastrar Torcedor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CadastroTimeScreen extends StatefulWidget {
  final List<Time> times;
  final List<Torcedor> torcedores;

  const CadastroTimeScreen({
    super.key,
    required this.times,
    required this.torcedores,
  });

  @override
  State<CadastroTimeScreen> createState() => _CadastroTimeScreenState();
}

class _CadastroTimeScreenState extends State<CadastroTimeScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController serieController = TextEditingController();
  final TextEditingController dataFundacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Time')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome do Time'),
              ),
              TextField(
                controller: serieController,
                decoration: const InputDecoration(labelText: 'Série'),
              ),
              TextField(
                controller: dataFundacaoController,
                decoration: const InputDecoration(
                  labelText: 'Data de Fundação',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nomeController.text.isNotEmpty &&
                      serieController.text.isNotEmpty &&
                      dataFundacaoController.text.isNotEmpty) {
                    final novoTime = Time(
                      nome: nomeController.text,
                      serie: serieController.text,
                      dataFundacao: dataFundacaoController.text,
                    );
                    widget.times.add(novoTime);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TabelaScreen(
                              times: widget.times,
                              torcedores: widget.torcedores,
                            ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Preencha todos os campos!'),
                        );
                      },
                    );
                  }
                },
                child: const Text('Cadastrar Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CadastroTorcedorScreen extends StatefulWidget {
  final List<Time> times;
  final List<Torcedor> torcedores;

  const CadastroTorcedorScreen({
    super.key,
    required this.times,
    required this.torcedores,
  });

  @override
  State<CadastroTorcedorScreen> createState() => _CadastroTorcedorScreenState();
}

class _CadastroTorcedorScreenState extends State<CadastroTorcedorScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Torcedor')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Torcedor',
                ),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: 'Time que Torce'),
              ),
              TextField(
                controller: dataNascimentoController,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nomeController.text.isNotEmpty &&
                      timeController.text.isNotEmpty &&
                      dataNascimentoController.text.isNotEmpty) {
                    final novoTorcedor = Torcedor(
                      nome: nomeController.text,
                      time: timeController.text,
                      dataNascimento: dataNascimentoController.text,
                    );
                    widget.torcedores.add(novoTorcedor);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TabelaScreen(
                              times: widget.times,
                              torcedores: widget.torcedores,
                            ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Preencha todos os campos!'),
                        );
                      },
                    );
                  }
                },
                child: const Text('Cadastrar Torcedor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabelaScreen extends StatefulWidget {
  final List<Time> times;
  final List<Torcedor> torcedores;

  const TabelaScreen({
    super.key,
    required this.times,
    required this.torcedores,
  });

  @override
  State<TabelaScreen> createState() => _TabelaScreenState();
}

class _TabelaScreenState extends State<TabelaScreen> {
  late List<Time> times;
  late List<Torcedor> torcedores;

  @override
  void initState() {
    super.initState();
    times = widget.times;
    torcedores = widget.torcedores;
  }

  void _mostrarMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.deepPurple),
                title: const Text('Editar'),
                onTap: () {
                  Navigator.pop(context);
                  _mostrarOpcoesEdicao();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.deepPurple),
                title: const Text('Excluir'),
                onTap: () {
                  Navigator.pop(context);
                  _mostrarDialogoExclusao();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _mostrarOpcoesEdicao() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Escolha o que editar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _editarTime();
                },
                child: const Text('Editar Time'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _editarTorcedor();
                },
                child: const Text('Editar Torcedor'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _editarTime() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Escolha um Time para Editar'),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(times.length, (index) {
                final time = times[index];
                return ListTile(
                  title: Text(time.nome),
                  onTap: () {
                    Navigator.pop(context);
                    _abrirTelaEdicaoTime(time, index);
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }

  void _abrirTelaEdicaoTime(Time time, int index) {
    final nomeController = TextEditingController(text: time.nome);
    final serieController = TextEditingController(text: time.serie);
    final dataFundacaoController = TextEditingController(
      text: time.dataFundacao,
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Editar Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome do Time'),
              ),
              TextField(
                controller: serieController,
                decoration: const InputDecoration(labelText: 'Série'),
              ),
              TextField(
                controller: dataFundacaoController,
                decoration: const InputDecoration(
                  labelText: 'Data de Fundação',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  times[index] = Time(
                    nome: nomeController.text,
                    serie: serieController.text,
                    dataFundacao: dataFundacaoController.text,
                  );
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _editarTorcedor() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Escolha um Torcedor para Editar'),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(torcedores.length, (index) {
                final torcedor = torcedores[index];
                return ListTile(
                  title: Text(torcedor.nome),
                  onTap: () {
                    Navigator.pop(context);
                    _abrirTelaEdicaoTorcedor(torcedor, index);
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }

  void _abrirTelaEdicaoTorcedor(Torcedor torcedor, int index) {
    final nomeController = TextEditingController(text: torcedor.nome);
    final timeController = TextEditingController(text: torcedor.time);
    final dataNascimentoController = TextEditingController(
      text: torcedor.dataNascimento,
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Editar Torcedor'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Torcedor',
                ),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: 'Time que Torce'),
              ),
              TextField(
                controller: dataNascimentoController,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  torcedores[index] = Torcedor(
                    nome: nomeController.text,
                    time: timeController.text,
                    dataNascimento: dataNascimentoController.text,
                  );
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoExclusao() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Excluir Item'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Times:'),
                ...List.generate(times.length, (index) {
                  final time = times[index];
                  return ListTile(
                    title: Text(time.nome),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          times.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  );
                }),
                const SizedBox(height: 16),
                const Text('Torcedores:'),
                ...List.generate(torcedores.length, (index) {
                  final torcedor = torcedores[index];
                  return ListTile(
                    title: Text(torcedor.nome),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          torcedores.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabelas de Times e Torcedores')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Tabela de Times',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Série')),
                  DataColumn(label: Text('Data de Fundação')),
                ],
                rows:
                    times
                        .map(
                          (time) => DataRow(
                            cells: [
                              DataCell(Text(time.nome)),
                              DataCell(Text(time.serie)),
                              DataCell(Text(time.dataFundacao)),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Tabela de Torcedores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Data de Nascimento')),
                ],
                rows:
                    torcedores
                        .map(
                          (torcedor) => DataRow(
                            cells: [
                              DataCell(Text(torcedor.nome)),
                              DataCell(Text(torcedor.time)),
                              DataCell(Text(torcedor.dataNascimento)),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarMenu,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.menu),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Time {
  final String nome;
  final String serie;
  final String dataFundacao;

  Time({required this.nome, required this.serie, required this.dataFundacao});
}

class Torcedor {
  final String nome;
  final String time;
  final String dataNascimento;

  Torcedor({
    required this.nome,
    required this.time,
    required this.dataNascimento,
  });
}
