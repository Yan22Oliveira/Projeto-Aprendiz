import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared.dart';

class FormGeral extends StatefulWidget {

  final String? initialValue;
  final String? labelText;
  final bool enabled;
  final bool autofocus;
  final bool autocorrect;
  final bool password;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;

  const FormGeral({
    this.initialValue,
    this.labelText,
    this.enabled     = true,
    this.autocorrect = false,
    this.autofocus   = false,
    this.password    = false,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.maxLines     = 1,
    this.textCapitalization = TextCapitalization.none,
    Key? key,
  }) : super(key: key);

  @override
  State<FormGeral> createState() => _FormGeralState();
}

class _FormGeralState extends State<FormGeral> {

  bool visivel = true;

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        hintColor: Colors.grey.shade800,
        cursorColor: Colors.black,
        primarySwatch: Colors.grey,
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        initialValue: widget.initialValue,
        controller: widget.controller,
        autofocus: widget.autofocus,
        enabled:widget.enabled,
        autocorrect: widget.autocorrect,
        obscureText: widget.password?visivel:false,
        maxLines: widget.maxLines,
        validator: widget.validator,
        textCapitalization: widget.textCapitalization,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        inputFormatters: widget.inputFormatters,
        style: TextStyles.formText,
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.black87,
              width: 0.5,
            ),
          ),
          suffixIcon: !widget.password
          ?null
          :IconButton(
            icon: Icon(
              !visivel?
              Icons.visibility:
              Icons.visibility_off,
              color: AppColors.primary,
            ),
            onPressed: (){
              setState(() {
                visivel = !visivel;
              });
            },
          ) ,
          labelText: widget.labelText,
          labelStyle: TextStyles.labelText,
        ),
      ),
    );

  }
}