import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
        maxLength: 10,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone),
            label: const Text('Mobile Number'),
            hintStyle: TextStyle(color: kblack),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kgrey))),
        style:
            TextStyle(fontSize: 16, color: kblack, fontWeight: FontWeight.w500),
      ),
    );
  }
}
