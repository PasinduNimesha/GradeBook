import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String name;
  final String code;
  final String documentId;
  final VoidCallback onTap;
  const LargeButton({super.key, required this.name, required this.code, required this.documentId, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(code),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
