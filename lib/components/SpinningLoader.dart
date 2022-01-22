import 'package:flutter/material.dart';

class SpinnerLoaderWidget extends StatefulWidget {
  const SpinnerLoaderWidget({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _SpinnerLoaderState();
}

class _SpinnerLoaderState  extends State<SpinnerLoaderWidget>
  with TickerProviderStateMixin {
  
  late AnimationController spinningAnimationController;

  @override
  void initState() {
    spinningAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    )..addListener(() {
        setState(() {});
      });
    spinningAnimationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: spinningAnimationController.value ,
      semanticsLabel: 'Linear progress indicator',
    ); 
  }

  @override
  void dispose() {
    spinningAnimationController.dispose();
    super.dispose();
  }
}

SpinnerLoaderWidget spinningLoader = const SpinnerLoaderWidget();