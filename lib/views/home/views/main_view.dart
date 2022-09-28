import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/views/home/cubit/mainCubit.dart';
import 'package:materialyou/views/home/state/mainState.dart';
import 'package:materialyou/views/home/views/home/view/HomeView.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(builder: (contextcubit, state) {
        if (state is EcoState) {
          return const Center(
            child:  Text('ECO page'),
          );
        } else if (state is HomeState) {
          return const HomeView();
        } else if (state is SettingsState) {
          return const Center(
            child: Text('SETTINGS page'),
          );
        } else {
          return const Center(
            child: Text('PROFILE page'),
          );
        }
      }),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: CupertinoColors.systemGreen),
        child: NavigationBar(
            backgroundColor: CupertinoColors.quaternarySystemFill,
            elevation: 0,
            animationDuration: const Duration(seconds: 1),
            selectedIndex: context.watch<MainCubit>().currentPage,
            onDestinationSelected: (v) {
              context.read<MainCubit>().changeState(v);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.eco_outlined),
                label: 'eco',
                selectedIcon: Icon(Icons.eco),
              ),
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'home',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                label: 'settings',
                selectedIcon: Icon(Icons.settings),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: 'profile',
                selectedIcon: Icon(Icons.person),
              ),
            ]),
      ),
    );
  }
}

// CupertinoSlidingSegmentedControl(
//           groupValue: _currentPage,
//           children: const {
//             0: Text('eco'),
//             1: Text('home'),
//             2: Text('settings'),
//             3: Text('profile'),
//           },
//           onValueChanged: (newValue) {
//             setState(() {
//               _currentPage = int.parse(newValue.toString());
//             });
//           }),
