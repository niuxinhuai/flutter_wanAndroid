#!/usr/bin/env bash

# 1. 将会清空本地的依赖缓存，
# 2. 重新从网上获取的依赖

echo ">>> clean start ..."
if [ ! -d "sh" ];then
  cd ..
fi
flutter clean
rm -rf build/
rm -rf .android/
rm -rf .ios/
rm -rf .idea/
rm -rf gen/

rm pubspec.lock
find . -name '*.iml' -type f -delete
rm .flutter-plugins
rm .packages


echo ">>> clean pub-cache"
rm -rf ~/.pub-cache/
#echo ">>> to rebuild"
#flutter create --org com.iwordnet .

echo ">>> pub upgrade ..."
flutter pub upgrade

