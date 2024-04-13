import 'package:flutter/material.dart';
import 'package:grade_book/screens/StudentsDetailScreen.dart';

import 'NavCard.dart';

class LowerHome extends StatelessWidget {
  const LowerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NavCard(
                text: 'Students',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentsDetailScreen()));
                }),
            SizedBox(height: 10),
            NavCard(
              text: 'Teachers',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
