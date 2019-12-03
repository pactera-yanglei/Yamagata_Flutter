import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class FAProgressBar extends StatefulWidget {
  var borderColor;

  var borderWidth;

  FAProgressBar(
      {Key key,
        this.currentValue = 0,
        this.maxValue = 100,
        this.size = 30,
        this.animatedDuration = const Duration(milliseconds: 3000),
        this.direction = Axis.horizontal,
        this.verticalDirection = VerticalDirection.down,
        this.borderRadius = 8,
        this.borderColor = const Color(0xFF004EA2),
        this.borderWidth = 0.2,
        this.backgroundColor = const Color(0x00000000),
        this.progressColor = const Color(0xFF004EA2),
        this.changeColorValue,
        this.changeProgressColor = const Color(0xFF5F4B8B),
        this.displayText})
      : super(key: key);
  final int currentValue;
  final int maxValue;
  final double size;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final double borderRadius;
  final Color backgroundColor;
  final Color progressColor;
  final int changeColorValue;
  final Color changeProgressColor;
  final String displayText;

  @override
  _FAProgressBarState createState() => _FAProgressBarState();
}

class _FAProgressBarState extends State<FAProgressBar>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double _currentBegin = 0;
  double _currentEnd = 0;


  @override
  void initState() {
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);
    triggerAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(FAProgressBar old) {
    triggerAnimation();
    super.didUpdateWidget(old);
  }

  void triggerAnimation() {
    setState(() {
      _currentBegin = _animation.value;
      _currentEnd = widget.currentValue / widget.maxValue;
      _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
          .animate(_controller);
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedProgressBar(
    animation: _animation,
    widget: widget,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar({
    Key key,
    Animation<double> animation,
    this.widget,
  }) : super(key: key, listenable: animation);
  final widget;

  double transformValue(x, begin, end, before) {
    double y = (end * x - (begin - before)) * (1 / before);
    return y < 0 ? 0 : ((y > 1) ? 1 : y);
  }

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    Color progressColor = widget.progressColor;

    if (widget.changeColorValue != null) {
      final _colorTween = ColorTween(
          begin: widget.progressColor, end: widget.changeProgressColor);
      progressColor = _colorTween.transform(transformValue(
          animation.value, widget.changeColorValue, widget.maxValue, 5));
    }

    List<Widget> progressWidgets = [];
    Widget progressWidget = new Container(
        decoration: BoxDecoration(
          color: progressColor,
//          borderRadius: BorderRadius.circular(widget.borderRadius),
        ));
    progressWidgets.add(progressWidget);



    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Center(
            child: Text((animation.value * widget.maxValue).toInt().toString() +
                widget.displayText),
          ),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: widget.direction == Axis.vertical ? widget.size : null,
            height: 10,
//            color: Color(0x00000000),
            decoration: BoxDecoration(
              color: Color(0x00000000),
//          borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: widget.borderColor, width: widget.borderWidth),
            ),
            child: Flex(
              direction: widget.direction,
              verticalDirection: widget.verticalDirection,
              children: <Widget>[
                Expanded(
                    flex: (animation.value * 100).toInt(),
                    child: Stack(children: progressWidgets)),
                Expanded(
                    flex: 100 - (animation.value * 100).toInt(), child: Container())
              ],
            ),
          ),
        ),Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: widget.direction == Axis.vertical ? widget.size : null,
            height: 10,

            decoration: BoxDecoration(
              color: Color(0x00000000),
            ),
            child: Flex(
              direction: widget.direction,
              verticalDirection: widget.verticalDirection,
              children: <Widget>[
                Expanded(
                    flex: (animation.value * 100).toInt(),
                    child: Stack(children: progressWidgets)),
                Expanded(
                    flex: 100 - (animation.value * 100).toInt(), child: Container(color: Color(0x00000000),))
              ],
            ),
          ),
        ),

        Container(
          height: 50,
          child: Center(
            child: Text('悪性コードチェック...'),
          ),
        ),
      ],
    );
  }
}
