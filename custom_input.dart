import 'package:flutter/material.dart';
class CustomInput extends StatefulWidget {
  final String type;
  final String label;
  final TextEditingController controller;
  final String? align;
  final String? errorMessage;
  final bool? disabled;
  final bool? required;
  final num? minLength;
  final num? maxLength;

  const CustomInput({
    super.key,
    required this.type,
    required this.label,
    required this.controller,
    this.align,
    this.errorMessage,
    this.disabled,
    this.required,
    this.minLength,
    this.maxLength,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isObscureText = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    if (widget.type == 'password') {
      isObscureText = true;
    }
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case 'text':
        return TextInputType.text;
      case 'number':
        return TextInputType.number;
      case 'email':
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  TextInputAction _getInputAction() {
    return TextInputAction.done;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType: _getKeyboardType(),
          textInputAction: _getInputAction(),
          obscureText: isObscureText,
          enabled: widget.disabled != true,
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: TextStyle(
              color: Colors.blue.shade300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue.shade700,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: widget.type == 'password'
                ? IconButton(
                    icon: Icon(
                      isObscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                  )
                : null,
          ),
          style: TextStyle(
            color: Colors.blue.shade700,
          ),
          validator: (value) {
            _text = value ?? '';
            if (widget.required == true && _text.isEmpty) {
              return widget.errorMessage ?? 'Este campo es requerido';
            }
            if (widget.minLength != null &&
                _text.length < widget.minLength!) {
              return 'Debe tener al menos ${widget.minLength} caracteres';
            }
            if (widget.maxLength != null &&
                _text.length > widget.maxLength!) {
              return 'Debe tener máximo ${widget.maxLength} caracteres';
            }
            return null;
          },
        ),
      ],
    );
  }
}