import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // <- Import here
import 'package:help/theme/color.dart';
import 'dart:math';

import '../theme/custompainter.dart';

class CurvedBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<String> svgIcons;  // <-- SVG asset paths
  final List<String> labels;

  const CurvedBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.svgIcons,
    required this.labels,
  }) : super(key: key);

  @override
  State<CurvedBottomNavBar> createState() => _CurvedBottomNavBarState();
}

class _CurvedBottomNavBarState extends State<CurvedBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _currentPos = 0;
  double _targetPos = 0;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _currentPos = _calculatePos(widget.selectedIndex);
      _targetPos = _currentPos;
      _animation = Tween<double>(begin: _currentPos, end: _targetPos).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      )..addListener(() {
        setState(() {});
      });
      _initialized = true;
    }
  }

  double _calculatePos(int index) {
    final width = MediaQuery.of(context).size.width;
    final segmentWidth = width / widget.svgIcons.length;
    return (segmentWidth * index) + (segmentWidth / 2);
  }

  void _onTap(int index) {
    widget.onItemTapped(index);
    setState(() {
      _currentPos = _animation.value;
      _targetPos = _calculatePos(index);
      _animation = Tween<double>(begin: _currentPos, end: _targetPos).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );
      _controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double dipCenter = _animation.value;

    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(size.width, 75),
              painter: NavBarPainter(dipCenter: dipCenter),
            ),
          ),

          Positioned(
            bottom: 10,
            left: dipCenter - 34.5,
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColor.softRed,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          widget.svgIcons[widget.selectedIndex],
                          color: Colors.white,
width: 35,
                          height: 35,
                        ),
                        Text(
                          widget.labels[widget.selectedIndex],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(widget.svgIcons.length, (index) {
                  if (index == widget.selectedIndex) {
                    return SizedBox(width: 65);
                  }
                  return GestureDetector(
                    onTap: () => _onTap(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            widget.svgIcons[index],
                            color: AppColor.palePink,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Text(widget.labels[index], style: TextStyle(fontSize: 12,color: AppColor.palePink)),
                        SizedBox(height: 10,)
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
