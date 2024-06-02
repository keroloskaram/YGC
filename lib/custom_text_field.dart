import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.validator,
      this.title,
      this.hint,
      this.maxLines,
      this.controller,
      this.keyboardType});

  final String? title;

  final String? hint;

  final int? maxLines;

  final TextEditingController? controller;

  final TextInputType? keyboardType;
  final String? Function(String? val)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: validator,
          keyboardType: keyboardType,
          controller: controller,
          maxLines: maxLines??1,
          autovalidateMode: AutovalidateMode.disabled,
          onSaved: (value) {},
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Colors.grey.withOpacity(0.5),
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Colors.grey.withOpacity(0.5),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Colors.grey.withOpacity(0.5),
            )),
            label: Text(title??''),
            hintText: hint??'',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
