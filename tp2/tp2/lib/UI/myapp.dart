import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/UI/home.dart';
import 'package:tp2/UI/ecran2.dart';
import 'package:tp2/UI/ecran3.dart';
import 'package:tp2/UI/settings.dart';
import 'package:tp2/UI/mytheme.dart';
import 'package:tp2/viewmodel/setting_view_model.dart';
import 'package:tp2/UI/add_task.dart';
import 'package:tp2/viewmodel/TaskViewModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp2/repository/database_repository.dart';


class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_){
              SettingViewModel settingViewModel = SettingViewModel();
              //getSettings est deja appelee dans le constructeur
              return settingViewModel;
            }),
        ChangeNotifierProvider(
            create:(_) {
              TaskViewModel taskViewModel = TaskViewModel(databaseRepo: databaseRepository(bd: database));
              taskViewModel.getTasks();
              return taskViewModel;
            } )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context,SettingViewModel notifier,child){
          return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
              title: 'TD2',
              home: MyHomePage(title: 'Mes Tâches',)
          );
        },
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    home(),
    ScreenTwo(),
    ScreenThree(),
    EcranSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Permet d'afficher plus de 3 items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Task 1"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Task 2"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      floatingActionButton: _selectedIndex==0?FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
        child: const Icon(Icons.add),):const SizedBox.shrink(),

    );
  }
}
