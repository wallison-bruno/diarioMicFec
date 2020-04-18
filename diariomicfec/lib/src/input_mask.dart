import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

MaskTextInputFormatter get phoneMask {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) ###-###-###', filter: {"#": RegExp(r'[0-9]')});
  return maskFormatter;
}
