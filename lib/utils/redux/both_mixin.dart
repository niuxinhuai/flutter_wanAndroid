import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'common/common_action.dart';

/// Created by cnting on 2020-03-23
/// 结合 TickerProviderStateMixin 、 WidgetsBindingObserverMixin（软件位于前后台）、PageVisibilityObserver（监听页面可见）

mixin ZMTickerProviderAndWidgetsBindingMixin<T> on Component<T> {
  @override
  ComponentState<T> createState() {
    return _BothState<T>();
  }
}

class _BothState<T> extends ComponentState<T>
    with
        TempSingleTickerProviderStateMixin<T>,
        PageVisibilityObserver,
        WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PageVisibilityBinding.instance.addObserver(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    PageVisibilityBinding.instance.removeObserver(this);
    disposeCtx();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    ctx.onLifecycle(LifecycleCreator.didChangeAppLifecycleState(state));
  }

  /// It can be regarded as Android "onStop" or iOS "viewDidDisappear"
  @override
  void onPageHide() {
    ctx.dispatch(CommonActionCreator.onPageHide());
  }

  /// It can be regarded as Android "onResume" or iOS "viewDidAppear"
  @override
  void onPageShow() {
    ctx.dispatch(CommonActionCreator.onPageShow());
  }

  @override
  void onBackground() {
    ctx.onLifecycle(LifecycleCreator.didChangeAppLifecycleState(
        AppLifecycleState.inactive));
    // ctx.dispatch(CommonActionCreator.onAppDidEnterBackground());
  }

  @override
  void onForeground() {
    ctx.onLifecycle(LifecycleCreator.didChangeAppLifecycleState(
        AppLifecycleState.resumed));
    // ctx.dispatch(CommonActionCreator.onAppDidEnterForeground());
  }
}

///TODO 等fish_redux升级到空安全，替换回 SingleTickerProviderStateMixin
@optionalTypeArgs
mixin TempSingleTickerProviderStateMixin<T> on ComponentState<T>
    implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(() {
      if (_ticker == null) return true;
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary(
            '$runtimeType is a SingleTickerProviderStateMixin but multiple tickers were created.'),
        ErrorDescription(
            'A SingleTickerProviderStateMixin can only be used as a TickerProvider once.'),
        ErrorHint(
          'If a State is used for multiple AnimationController objects, or if it is passed to other '
          'objects and those objects might use it more than one time in total, then instead of '
          'mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.',
        ),
      ]);
    }());
    _ticker = Ticker(onTick,
        debugLabel: kDebugMode ? 'created by ${describeIdentity(this)}' : null);
    // We assume that this is called from initState, build, or some sort of
    // event handler, and that thus TickerMode.of(context) would return true. We
    // can't actually check that here because if we're in initState then we're
    // not allowed to do inheritance checks yet.
    return _ticker!;
  }

  @override
  void dispose() {
    assert(() {
      if (_ticker == null || !_ticker!.isActive) return true;
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('$this was disposed with an active Ticker.'),
        ErrorDescription(
          '$runtimeType created a Ticker via its SingleTickerProviderStateMixin, but at the time '
          'dispose() was called on the mixin, that Ticker was still active. The Ticker must '
          'be disposed before calling super.dispose().',
        ),
        ErrorHint(
          'Tickers used by AnimationControllers '
          'should be disposed by calling dispose() on the AnimationController itself. '
          'Otherwise, the ticker will leak.',
        ),
        _ticker!.describeForError('The offending ticker was'),
      ]);
    }());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_ticker != null) _ticker!.muted = !TickerMode.of(context);
    super.didChangeDependencies();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    String? tickerDescription;
    if (_ticker != null) {
      if (_ticker!.isActive && _ticker!.muted)
        tickerDescription = 'active but muted';
      else if (_ticker!.isActive)
        tickerDescription = 'active';
      else if (_ticker!.muted)
        tickerDescription = 'inactive and muted';
      else
        tickerDescription = 'inactive';
    }
    properties.add(DiagnosticsProperty<Ticker>('ticker', _ticker,
        description: tickerDescription,
        showSeparator: false,
        defaultValue: null));
  }
}
