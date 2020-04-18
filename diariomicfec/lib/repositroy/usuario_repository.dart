import 'dart:convert';
import 'dart:io';

import 'package:diariomicfec/model/usuario_model.dart';
import 'package:path_provider/path_provider.dart';

class UsuarioHelper {
  String nomeKey = 'nomeKey';
  String emailKey = 'emailKey';
  String telefoneKey = 'telefoneKey';
  String idadeKey = 'idadeKey';
  String sexoKey = 'sexoKey';

  Map usuarioMap = {'Usuario': null};

  Map toMap(Usuario usuario) {
    Map<String, dynamic> map = {
      nomeKey: usuario.nome,
      emailKey: usuario.email,
      telefoneKey: usuario.telefone,
      idadeKey: usuario.idade,
      sexoKey: usuario.sexo,
    };
    return map;
  }

  Usuario fromMap(map) {
    Usuario usuario = Usuario();
    usuario.nome = map[nomeKey];
    usuario.email = map[emailKey];
    usuario.telefone = map[telefoneKey];
    usuario.idade = map[idadeKey];
    usuario.sexo = map[sexoKey];
    return usuario;
  }

  Future<bool> saveUsuario(Usuario usuario) async {
    try {
      usuarioMap['Usuario'] = toMap(usuario);
      await _saveData();
      return true;
    } catch (e) {
      return false;
    }
  }

  Usuario getUsuario() {
    _readData().then((data) {
      usuarioMap = json.decode(data);
    });

    return fromMap(usuarioMap['Usuario']);
  }

  Future<File> _getFile() async {
    final directory =
        await getApplicationSupportDirectory(); //-> Directory: '/data/user/0/com.example.lista_de_tarefas/files'
    // -> Pega o diretório onde pode armazenar os documentos do app.

    return File('${directory.path}/data.json');
  }

  Future<File> _saveData() async {
    String data = json.encode(usuarioMap);
    //-> Transformando o _toDoList (Tipo List) em Json.
    final file = await _getFile();
    // -> Espera o araquvo chegar para atribuir à variavel file.
    return file.writeAsString(data);
    // -> Escreve os dados no arquivo como texto e retorna o mesmo. Obs: Os dados em texto estão convertidos em formato JSON!
  }

  Future<String> _readData() async {
    try {
      final file =
          await _getFile(); //-> File: '/data/user/0/com.example.lista_de_tarefas/files/data.json'

      return file.readAsString();
      // -> Ler os dados e retona o arquivo em string futura.
      // Obs: Como pode ocorrer erro na leitura a atribuição da variavel _toDolist ocorre fora dessa função.
    } catch (e) {
      return null;
    }
  }
}
