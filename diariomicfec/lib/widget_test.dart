import 'package:diariomicfec/model/usuario_model.dart';
import 'package:diariomicfec/repositroy/usuario_repository.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  UsuarioHelper helper = UsuarioHelper();
  Usuario usuario = Usuario();
  Usuario usuario2;

  @override
  void initState() {
    super.initState();

    usuario.nome = 'wallison';

    helper.saveUsuario(usuario);

    usuario2 = helper.getUsuario();

    print(usuario2);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
