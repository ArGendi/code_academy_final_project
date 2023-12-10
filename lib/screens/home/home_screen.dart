import 'package:code_academy_auth/constants.dart';
import 'package:code_academy_auth/controllers/home/home_cubit.dart';
import 'package:code_academy_auth/controllers/resturants/resturants_cubit.dart';
import 'package:code_academy_auth/controllers/user/user_cubit.dart';
import 'package:code_academy_auth/local/cache.dart';
import 'package:code_academy_auth/screens/home/bodies/home_body.dart';
import 'package:code_academy_auth/screens/home/bodies/profile_body.dart';
import 'package:code_academy_auth/screens/home/bodies/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> bodies = [
    HomeBody(),
    SettingsBody(),
    ProfileBody(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //BlocProvider.of<ResturantsCubit>(context).getAllResturnats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg'),
              ),
              accountName: Text(Cache.getKey(nameKey).toString()),
              accountEmail: Text(Cache.getKey(emailKey).toString()),
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                BlocProvider.of<UserCubit>(context).logout(context);
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
                DateTime.now().hour < 12 ? 'Good morning, ' : "Good evening, "),
            Text(Cache.getKey(nameKey).toString())
          ],
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state){
          return bodies[BlocProvider.of<HomeCubit>(context).currentPage];
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) {
              BlocProvider.of<HomeCubit>(context).changePage(value);
            },
            currentIndex: BlocProvider.of<HomeCubit>(context).currentPage,
            selectedItemColor: Colors.orange,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
