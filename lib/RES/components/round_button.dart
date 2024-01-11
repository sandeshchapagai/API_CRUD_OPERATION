import 'package:flutter/material.dart';
import 'package:mvvm/RES/color.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundedButton(
      {required this.title, this.loading = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.button_color,
            borderRadius: BorderRadius.circular(10)),
        width: 200,
        height: 50,
        child:
            Center(child: loading ? const CircularProgressIndicator(color: Colors.white,) : Text(title)),
      ),
    );
  }
}
