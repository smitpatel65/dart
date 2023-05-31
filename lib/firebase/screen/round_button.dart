import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String tital;
  final VoidCallback ontep;
  final bool loading;
  const RoundButton(
      {super.key,
      required this.tital,
      required this.ontep,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontep,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: loading ? const CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):
            Text( tital,style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
