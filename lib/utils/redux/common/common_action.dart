import 'package:fish_redux/fish_redux.dart';

///

enum CommonAction {
  onFetchData,
  didFetchDataStart,
  didFetchDataSuccess,
  didFetchDataError,
  onPageShow,
  onPageHide,
}

class CommonActionCreator {
  static Action onFetchData({Object? payload = null}) {
    return Action(CommonAction.onFetchData, payload: payload);
  }

  static Action didFetchDataStart({Object? payload = null}) {
    return Action(CommonAction.didFetchDataStart, payload: payload);
  }

  static Action didFetchDataSuccess({Object? payload = null}) {
    return Action(CommonAction.didFetchDataSuccess, payload: payload);
  }

  static Action didFetchDataError({Object? payload = null}) {
    return Action(CommonAction.didFetchDataError, payload: payload);
  }

  static Action onPageShow() {
    return const Action(CommonAction.onPageShow);
  }

  static Action onPageHide() {
    return const Action(CommonAction.onPageHide);
  }
}
