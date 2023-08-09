// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ideploy_package/app_global.dart';
import 'package:ideploy_package/domain/entities/app_message/app_message.dart';
import 'package:ideploy_package/domain/entities/failure/failure.dart';

class AppAlert extends StatefulWidget {
  final int secondsDuration;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const AppAlert({
    required this.scaffoldMessengerKey,
    required this.secondsDuration,
    Key? key,
  }) : super(key: key);

  @override
  _AppAlertState createState() => _AppAlertState();
}

class _AppAlertState extends State<AppAlert> {
  Timer _timer = Timer(const Duration(seconds: 0), () => VoidCallback);
  int _count = 0;
  bool _show = false;
  Failure? _failure;
  AppMessage? _message;

  @override
  void initState() {
    super.initState();
    AppGlobal.instance.streamError.stream.listen((Failure? failure) {
      if (failure != null) {
        _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
        setState(() {
          _count = 0;
          _show = true;
          _failure = failure;
          _message = null;
        });
      } else {
        _timer = Timer(const Duration(seconds: 0), () => VoidCallback);
        setState(() {
          _failure = null;
        });
      }
    });

    AppGlobal.instance.streamMessage.stream.listen((AppMessage message) {
      _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
      setState(() {
        _count = 0;
        _show = true;
        _failure = null;
        _message = message;
      });
    });
  }

  @override
  void didUpdateWidget(covariant AppAlert oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_show && mounted) {
      _timer.cancel();
      setState(() {
        _timer = Timer(const Duration(seconds: 0), () => VoidCallback);
        _count = 0;
        _show = false;
      });
    }
  }

  void _onTimer(Timer timer) {
    if (mounted) {
      if (_count >= widget.secondsDuration) {
        _timer.cancel();
        setState(() {
          _show = false;
        });
      } else {
        setState(() {
          _count++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
