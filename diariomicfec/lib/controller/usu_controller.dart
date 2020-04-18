import 'package:diariomicfec/model/usuario_model.dart';
import 'package:diariomicfec/repositroy/usuario_repository.dart';
import 'package:flutter/material.dart';

//* Controller é está mais relacionado a view que ao model.
class UsuController {
  final formKey = GlobalKey<FormState>();
  //* Obs: Que esse é um elemento usado na view

  Usuario usuario = Usuario();
  UsuarioHelper _usuarioHelper = UsuarioHelper();

  setNome(String nome) => usuario.nome = nome;
  setEmail(String email) => usuario.email = email;
  setTelefone(String telefone) => usuario.telefone = telefone;
  setIdade(String idade) => usuario.idade = idade;
  seSexo(String sexo) => usuario.sexo = sexo;
}
