import 'package:flutter/material.dart';

class JoinBody extends StatefulWidget {
  const JoinBody({Key? key}) : super(key: key);

  @override
  State<JoinBody> createState() => _JoinBodyState();
}

class _JoinBodyState extends State<JoinBody> {
  late TextEditingController code;

  @override
  void initState() {
    code = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Enter the code provided by the meeting organizer",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: TextField(
              controller: code,
              decoration: const InputDecoration(
                hintText: "Example: abc-mnop-xyz",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
