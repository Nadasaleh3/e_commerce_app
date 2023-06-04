import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> showDialogEx(BuildContext context,
      {String? title, String? content}) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title ?? ''),
        content: Text(content ?? ''),
        actions: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 24, 59, 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Ok',
                      selectionColor: Color.fromARGB(255, 24, 59, 25),
                    )),
              ))
            ],
          )
        ],
      ),
    );
  }
}
