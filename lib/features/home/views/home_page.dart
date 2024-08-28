import 'package:educational_quiz_game/features/auth/provider/auth_provider.dart';
import 'package:educational_quiz_game/features/home/views/category_page.dart';
import 'package:educational_quiz_game/features/home/views/history_page.dart';
import 'package:educational_quiz_game/features/home/views/profile_page.dart';
import 'package:educational_quiz_game/generated/assets.dart';
import 'package:educational_quiz_game/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(Assets.imagesEqLogoT, width: 100),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton(
                onSelected: (value) {
                  if (value == 'logout') {
                    ref.read(userProvider.notifier).signOut();
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'logout',
                    child: Padding(
                      padding: EdgeInsets.only(right: 25, left: 10),
                      child: Text('Logout'),
                    ),
                  ),
                ],
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: user.profileImage.isNotEmpty
                      ? NetworkImage(user.profileImage)
                      : null,
                  child: user.profileImage.isEmpty
                      ? Text(
                          user.userName.isNotEmpty
                              ? user.userName[0].toUpperCase()
                              : '',
                          style: GoogleFonts.poppins(fontSize: 25),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            currentIndex: ref.watch(homeNavProvider),
            onTap: (index) {
              ref.read(homeNavProvider.notifier).state = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              //history
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: () {
              if (ref.watch(homeNavProvider) == 0) {
                return const CategoryPage();
              } else if (ref.watch(homeNavProvider) == 1) {
                return const HistoryPage();
              } else {
                return ProfilePage();
              }
            }()),
      ),
    );
  }
}
