import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String title;
  final TextInputType keyboardType;
  final bool required;
  final bool obscureText;
  final FormFieldValidator<dynamic>? validator;
  const Inputfield(
      {super.key,
      required this.controller,
      this.maxLines = 1,
      this.validator,
      required this.title,
      this.keyboardType = TextInputType.text,
      this.required = false,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              if (required)
                Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            // decoration: const InputDecoration(labelText: 'Message'),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            maxLines: maxLines,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
