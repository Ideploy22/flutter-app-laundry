import 'dart:async';

import 'package:app_laundry/domain/theme/theme_constants.dart';
import 'package:app_laundry/presentation/common/buttons/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:ideploy_package/presentation/translate/translate.dart';

class LoadingIndicator extends StatefulWidget {
  final Widget child;
  final String? message;
  final bool loading;
  final int timeOut;
  final void Function() onTimeOut;

  const LoadingIndicator({
    required this.child,
    required this.onTimeOut,
    this.message,
    this.loading = false,
    this.timeOut = 15,
    super.key,
  });

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with I18nTranslateMixin {
  bool _timedOut = false;
  int _count = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _eraseTimer();
    setBaseTranslate(base: '');
  }

  @override
  void didUpdateWidget(covariant LoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.loading && mounted) {
      _eraseAll();
    } else {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    if (mounted) {
      if (_count >= widget.timeOut || !widget.loading) {
        _doTimedOut();
      } else {
        _incrementTimer();
      }
    }
  }

  void _incrementTimer() {
    setState(() {
      _count++;
    });
  }

  void _doTimedOut() {
    _timer.cancel();
    setState(() {
      _timedOut = true;
    });
  }

  void _clearTimedOut() {
    setState(() {
      _timedOut = false;
    });
  }

  void _eraseAll() {
    _timer.cancel();
    setState(() {
      _eraseTimer();
      _count = 0;
    });
  }

  void _eraseTimer() {
    _timer = Timer(const Duration(seconds: 0), () {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: <Widget>[
            widget.child,
            if (widget.loading)
              Container(
                padding: const EdgeInsets.all(ThemeConstants.doublePadding),
                height: constraints.biggest.height,
                width: constraints.biggest.width,
                alignment: Alignment.center,
                color: const Color.fromRGBO(5, 10, 0, 0.85),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: ThemeConstants.iconSizeMedium,
                      width: ThemeConstants.iconSizeMedium,
                      child: CircularProgressIndicator(),
                    ),
                    if (widget.message != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: ThemeConstants.doublePadding,
                        ),
                        child: Text(
                          widget.message!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    if (_timedOut)
                      FilledActionButton(
                        label: translate('common.cancel'),
                        onTap: () => _cancelLoading(),
                        color: Theme.of(context).colorScheme.surface,
                        fillColor: Theme.of(context).colorScheme.primary,
                        fullWidth: false,
                      ),
                  ],
                ),
              ),
            if (!_timedOut && widget.loading)
              Positioned(
                bottom: ThemeConstants.doublePadding,
                child: Container(
                  height: 3.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeConstants.padding,
                  ),
                  width: constraints.biggest.width,
                  child: LinearProgressIndicator(
                    value: _count / widget.timeOut,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void _cancelLoading() {
    _eraseAll();
    _clearTimedOut();
    widget.onTimeOut();
  }
}
