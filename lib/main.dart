import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/global.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const Whatsapp(),
    ),
  );
}

class Whatsapp extends StatefulWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> with TickerProviderStateMixin {
  late TabController? _tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Globals.myTab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (Globals.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade700,
            title: const Text("  Whatsapp"),
            actions: [
              Switch(
                  value: Globals.isAndroid,
                  onChanged: (val) {
                    setState(() {
                      Globals.isAndroid = val;
                    });
                  }),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.camera_alt_outlined),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.search),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.more_vert_sharp),
              const SizedBox(
                width: 5,
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              onTap: (val) {
                setState(() {
                  pageController.animateToPage(val,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                });
              },
              tabs: Globals.myTab
                  .map(
                    (e) => Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      child: Text(
                        "${e['label']}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                _tabController!.animateTo(val);
              });
            },
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: Globals.msgList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage("${e['img']}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${e['name']}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                          ),
                                          child: Text(
                                            "${e['message']}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.teal.shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              "${e['msgint']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                indent: 95,
                                endIndent: 10,
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.hourglass_empty,
                      size: 120,
                    ),
                    Text(
                      "Empty",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.hourglass_empty,
                      size: 120,
                    ),
                    Text(
                      "Empty",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.teal.shade700,
            child: const Icon(Icons.message),
          ),
        ),
      );
    } else {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: Builder(
          builder: (context) {
            return CupertinoPageScaffold(
              child: CupertinoTabScaffold(
                backgroundColor: CupertinoColors.black,
                tabBar: CupertinoTabBar(
                  currentIndex: 3,
                  backgroundColor: CupertinoColors.black,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.camera_viewfinder,
                      ),
                      label: 'Status',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.phone,
                      ),
                      label: 'Calls',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.camera,
                      ),
                      label: 'Camera',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                      ),
                      label: 'Chats',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.settings,
                      ),
                      label: 'Settings',
                    ),
                  ],
                ),
                tabBuilder: (context, i) {
                  if (i == 3) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 18,
                        right: 18,
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: CupertinoColors.activeBlue,
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.add,
                                  size: 25,
                                  color: CupertinoColors.activeBlue,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Chats",
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w600,
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                  Switch.adaptive(
                                    value: Globals.isAndroid,
                                    onChanged: (val) {
                                      setState(() {
                                        Globals.isAndroid = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Brodcast List",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: CupertinoColors.activeBlue,
                                    ),
                                  ),
                                  Text(
                                    "New Groups",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: CupertinoColors.activeBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: CupertinoColors.systemGrey,
                            ),
                            Column(
                              children: Globals.msgList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${e['img']}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "${e['name']}",
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: CupertinoColors
                                                            .white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 3,
                                                      ),
                                                      child: Text(
                                                        "${e['message']}",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "${e['time']}",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 5,
                                                      ),
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: CupertinoColors
                                                              .activeBlue,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Text(
                                                          "${e['msgint']}",
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            indent: 95,
                                            endIndent: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      "Invalid",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.destructiveRed,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    }
  }
}
