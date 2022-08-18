import 'package:business_banking_app/shared_components/widget/loader/dot_type.dart';
import 'package:flutter/material.dart';

import 'animated_dot_widget.dart';

class AppLoadingWidget extends StatefulWidget {
  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  const AppLoadingWidget(
      {Key key = const Key('appLoadingWidget'),
      this.dotOneColor = Colors.redAccent,
      this.dotTwoColor = Colors.green,
      this.dotThreeColor = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.diamond,
      this.dotIcon = const Icon(Icons.blur_on)})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppLoadingWidgetState();
  }
}

class _AppLoadingWidgetState extends State<AppLoadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    _initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            translate(
              child: AnimatedDotWidget(
                radius: 10.0,
                color: widget.dotOneColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
              animation: animation_1,
            ),
            translate(
              child: AnimatedDotWidget(
                radius: 10.0,
                color: widget.dotTwoColor,
                type: widget.dotType,
                icon: widget.dotIcon,
              ),
              animation: animation_2,
            ),
            translate(
                child: AnimatedDotWidget(
                  radius: 10.0,
                  color: widget.dotThreeColor,
                  type: widget.dotType,
                  icon: widget.dotIcon,
                ),
                animation: animation_3),
          ],
        ),
      ),
    );
  }

  Widget translate(
      {required Widget child, required Animation<double> animation}) {
    return Transform.translate(
      offset: Offset(
        0.0,
        _calculateAnim1DYOffset(animation),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }

  double _calculateAnim1DYOffset(Animation<double> animation) {
    return -30 *
        (animation.value <= 0.50 ? animation.value : 1.0 - animation.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _initAnimation() {
    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.80, curve: Curves.ease),
    ));

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.1, 0.9, curve: Curves.ease),
    ));

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.2, 1.0, curve: Curves.ease),
    ));

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }
}
