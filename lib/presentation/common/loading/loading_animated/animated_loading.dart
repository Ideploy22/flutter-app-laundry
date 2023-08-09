import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideploy_package/app_global.dart';
import 'package:rive/rive.dart';

enum LoadingAnimationAction { showError, showSuccess }

class AnimatedLoading extends StatefulWidget {
  final StreamController<LoadingAnimationAction?>? streamAnimation;

  const AnimatedLoading({
    this.streamAnimation,
    super.key,
  });

  @override
  _AnimatedLoadingState createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading> {
  Artboard? _riveArtboard;
  SMIInput<bool>? _successInput;
  SMIInput<bool>? _errorInput;

  late StreamController<LoadingAnimationAction?> _streamAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _observeAnimation();
  }

  void _observeAnimation() {
    _streamAnimation = widget.streamAnimation ?? StreamController<LoadingAnimationAction?>.broadcast();
    _streamAnimation.stream.listen((LoadingAnimationAction? event) {
      if (event != null) {
        setState(() {
          if (event == LoadingAnimationAction.showError) {
            _errorInput!.value = true;
          } else {
            _successInput!.value = true;
          }
        });
      }
    });
  }

  Future<void> _initAnimation() async {
    final ByteData _data = await rootBundle.load('assets/animations/checkerror.riv');
    final RiveFile _file = RiveFile.import(_data);
    final Artboard _artBoard = _file.mainArtboard;
    final StateMachineController? _riveController = StateMachineController.fromArtboard(_artBoard, 'State Machine 1');
    if (_riveController != null) {
      _artBoard.addController(_riveController);
      _successInput = _riveController.findInput('Check');
      _errorInput = _riveController.findInput('Error');

      if (_successInput != null) {
        _successInput!.value = false;
      }

      if (_errorInput != null) {
        _errorInput!.value = false;
      }
    }

    setState(() => _riveArtboard = _artBoard);
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary))
        : SizedBox(
            width: AppGlobal.instance.size.width * _factor(),
            height: AppGlobal.instance.size.width * _factor(),
            child: Rive(
              artboard: _riveArtboard!,
              fit: BoxFit.fitWidth,
            ),
          );
  }

  double _factor() {
    return AppGlobal.instance.isLandscape ? 0.10 : 0.25;
  }
}
