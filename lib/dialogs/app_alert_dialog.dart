import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';

Future appAlertDialog(BuildContext context, String title, String content,
    {String? actionOk,
    String? actionNo,
    Function()? onActionOk,
    Function()? onActionNo}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: kRed, fontSize: 20),
          ),
          content: Text(content),
          actions: [
            if (onActionOk != null)
              GestureDetector(
                  onTap: () {
                    onActionOk();
                  },
                  child: Text(
                    actionOk!,
                    style: Chicos(color: kRed),
                  )),
            if (onActionNo != null)
              GestureDetector(
                  onTap: () {
                    onActionNo();
                  },
                  child: Text(
                    actionNo!,
                    style: Chicos(color: kRed),
                  ))
          ],
        );
      });
}
