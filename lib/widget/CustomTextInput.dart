import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextInput extends StatelessWidget {
  CustomTextInput(
      {super.key, required this.hint, required this.preIcon, this.suffIcon,required this.onChange,this.keyboardType});
  final String hint;
  final IconData? suffIcon;
  final IconData preIcon;
  dynamic onChange;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(50, 17, 50, 0),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(159, 227, 210, 255)),
      child: TextField(
        onChanged: onChange,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: Icon(
            preIcon,
            color: const Color.fromRGBO(104, 58, 183, 1),
            size: 20,
          ),
          suffixIcon: Icon(
            suffIcon,
            color: const Color.fromRGBO(104, 58, 183, 1),
            size: 20,
          ),
        ),
      ),
    );
  }
}
