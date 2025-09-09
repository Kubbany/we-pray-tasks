import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/prayers_view.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/qibla_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    QiblaView(),
    PrayersView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(getIt.get<LocationRepo>()),
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 27,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kUnselectedColor,
          selectedLabelStyle: AppStyles.semiBoldHanken11,
          onTap: (index) {
            setState(
              () => _currentIndex = index,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Image.asset(
                  Assets.imagesQiblaNavBar,
                  color: _currentIndex == 0 ? kPrimaryColor : kUnselectedColor,
                ),
              ),
              label: 'Qibla',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Image.asset(
                  Assets.imagesPrayersNavBar,
                  color: _currentIndex == 1 ? kPrimaryColor : kUnselectedColor,
                ),
              ),
              label: 'Prayer Times',
            ),
          ],
        ),
      ),
    );
  }
}
