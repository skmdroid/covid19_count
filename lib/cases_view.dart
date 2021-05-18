import 'package:flutter/material.dart';

class CasesView extends StatelessWidget {
  final Color color;
  final String casesTitle;
  final String casesValue;

  CasesView(this.color, this.casesTitle, this.casesValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: this.color,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                casesTitle,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
          Text(
            casesValue,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
