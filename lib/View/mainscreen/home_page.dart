import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app2/constants/colors.dart' as CustomColors;

import '../../Audiobook/audio_bookui.dart';
import '../../Ebook/ebookui.dart';
import '../setting/setting_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY_COLOR,
        foregroundColor: CustomColors.TEXT_WHITE,
        centerTitle: true,
        title: Text(
          'Bhagavad Geeta',
        ),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
              },
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: CustomColors.TEXT_WHITE,
              ),
            ),
            itemBuilder: (cxt) => List.generate(
              1,
              (index) {
                return PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                        Icon(
                          CupertinoIcons.settings_solid,
                          color: CustomColors.TEXT_BLACK,
                        ),



                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.TEXT_BLACK,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                50.0,
              ),
            ),
            elevation: 1.0,
            child: Container(
              width: width * 0.6,
              height: 48.0,
              decoration: BoxDecoration(
                color: CustomColors.TEXT_WHITE,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                child: TabBar(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: CustomColors.PRIMARY_COLOR,
                  ),
                  labelColor: CustomColors.TEXT_WHITE,
                  unselectedLabelColor: CustomColors.TEXT_BLACK,
                  tabs: [
                    Tab(
                      text: 'E-Book',
                    ),
                    Tab(
                      text: 'Audio Book',
                    ),
                  ],
                ),
              ),
            ),
          ),
          // tab bar view here
          SizedBox(
            height: 24.0,
          ),
          Container(
            width: width * 0.9,
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(90.0),
                    ),
                    borderSide: BorderSide(
                      color: CustomColors.PRIMARY_COLOR,
                    ),
                  ),
                  focusColor: CustomColors.PRIMARY_COLOR,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: CustomColors.TEXT_BLACK_SECONDARY,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  filled: false,
                  fillColor: CustomColors.TEXT_BLACK_SECONDARY,
                  hintText: '',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [EBook(), AudioBook()],
            ),
          ),
        ],
      ),
    );
  }
}
