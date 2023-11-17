import 'package:flutter/material.dart';

class ButtonSheetCustom {
  static void alertError({String? messageError, context}) => showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close_outlined),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Text('$messageError'),
              ],
            ),
          ),
        );
      });
}
