import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white, // Color de texto por defecto es blanco
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onPrimary: textColor,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        textStyle: TextStyle(fontSize: 16, color: textColor), // Aplicar color de texto
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4,
        shadowColor: Colors.blue.shade200,
      ),
      child: Text(text),
    );
  }
}


































































/* class CustomButton extends StatelessWidget {
  final Color color;
  final String size;
  final bool disabled;
  final bool loading;
  final String? text;
  final IconData? icon;

  const CustomButton({
    super.key,
    this.color = Colors.blue,
    this.size = 'm',
    this.disabled = false,
    this.loading = false,
    this.text,
    this.icon,
  });

  double getButtonSize() {
    switch (size) {
      case 's':
        return 120.0;
      case 'm':
        return 160.0;
      case 'l':
        return 200.0;
      case 'xl':
        return 240.0;
      default:
        return 160.0;
    }
  }

  Widget showLoading() {
    return const SizedBox(
      width: 24.0,
      height: 24.0,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget showButtonText() {
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
        if (text != null) const SizedBox(width: 8.0),
        if (text != null)
          Text(
            text ?? '',
            style: const TextStyle(color: Colors.white),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : () => print("Button pressed"),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [loading ? showLoading() : showButtonText()],
        ),
      ),
    );
  }
}
 */