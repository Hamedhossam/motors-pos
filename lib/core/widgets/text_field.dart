import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
    super.key,
    required this.tittle,
    required this.maxLines,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
  });
  final String tittle;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "the field is required !";
        } else {
          return null;
        }
      },
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: tittle,
        labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        hintText: "type $tittle of your note",
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
      maxLines: maxLines,
    );
  }
}
