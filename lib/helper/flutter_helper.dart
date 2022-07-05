import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

EventBus eventBus = EventBus();

class FlutterBindings extends WidgetsFlutterBinding with BoostFlutterBinding {}
