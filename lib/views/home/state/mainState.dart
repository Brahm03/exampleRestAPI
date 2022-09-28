import 'package:flutter/material.dart';

@immutable
abstract class MainState {
  const MainState();
}

class EcoState extends MainState {
  const EcoState();
}

class HomeState extends MainState {
  const HomeState();
}

class SettingsState extends MainState {
  const SettingsState();
}

class ProfileState extends MainState {
  const ProfileState();
}
