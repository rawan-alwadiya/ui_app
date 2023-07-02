import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    Key? key,
    required bool currentPage,
    double marginEnd = 0,
  }) : _currentPage = currentPage, _marginEnd = marginEnd, super(key: key);

  final bool _currentPage;
  final double _marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 4,
      margin: EdgeInsetsDirectional.only(end: _marginEnd),
      decoration: BoxDecoration(
        color: _currentPage? Color(0xFF6A90F2) : Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

