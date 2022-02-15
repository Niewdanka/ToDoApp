import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Icon(
              (Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
