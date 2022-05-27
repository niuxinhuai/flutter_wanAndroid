import 'package:collection/collection.dart' show IterableExtension;
import 'package:fish_redux/fish_redux.dart';

/// Created by cnting on 2019-11-19
class ReduxUtil {
  ///如果action是Lifecycle，则sup和sub都调用
  static Effect<T> mergeEffectsExcludeLifecycle<T extends K, K>(Effect<K> sup,
      [Effect<T>? sub]) {
    return (Action action, Context<T> ctx) {
      Object? result = sub?.call(action, ctx);
      if (action.type is Lifecycle) {
        return sup.call(action, ctx) ?? result;
      } else {
        return result ?? sup.call(action, ctx);
      }
    };
  }

  static Effect<T>? combineEffectsExcludeLifecycle<T>(
          Map<Object, SubEffect<T>> map) =>
      (map == null || map.isEmpty)
          ? null
          : (Action action, Context<T> ctx) {
              final SubEffect<T>? subEffect = map.entries
                  .firstWhereOrNull(
                    (MapEntry<Object, SubEffect<T>> entry) =>
                        action.type == entry.key,
                  )
                  ?.value;

              if (subEffect != null) {
                return subEffect.call(action, ctx) ?? null;
              }

              //skip-lifecycle-actions
              if (action.type is Lifecycle) {
                return null;
              }

              /// no subEffect
              return null;
            };


}
