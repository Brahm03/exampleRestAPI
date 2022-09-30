part of 'settings_cubit.dart';

abstract class SettingsState {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SearchError extends SettingsState {
  const SearchError();
}

class SearchComplete extends SettingsState {
  const SearchComplete();
}
