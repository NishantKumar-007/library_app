import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? logic;
  final String buttonText;
  const CustomButton({Key? key, required this.logic, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(40, 62, 80, 0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          minimumSize: Size(double.maxFinite, 65.0),
        ),
        onPressed: logic,
        child: Text(buttonText,
            style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
