import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color color;

  const PrimaryButton({Key key, this.onPressed, this.label, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        side: MaterialStateProperty.all(
          BorderSide(
              color: color == null ? Color(0XFF00838F) : color, width: 2),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 12,
            color: color == null ? Color(0XFF00838F) : color,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
