import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gojo_renthub/Myproperty/model/my_property_model.dart';
import 'package:gojo_renthub/Myproperty/repo/my_property_repo.dart';
import 'package:gojo_renthub/Profile/screens/notification_screen.dart';
import 'package:gojo_renthub/views/screens/bottom_navigation_pages/homepage.dart';
import 'package:gojo_renthub/views/screens/bottom_navigation_pages/profile_screen.dart';
import 'package:gojo_renthub/views/screens/home_and _details_page/details.dart';
import 'package:gojo_renthub/views/screens/tabs/categories.dart';
import 'package:gojo_renthub/views/shared/components/models/House.dart';
import 'package:gojo_renthub/views/shared/components/widgets/RentHouseType.dart';
import 'package:gojo_renthub/views/shared/components/widgets/Search.dart';
import 'package:gojo_renthub/views/shared/components/widgets/listOfHouse.dart';
import 'package:gojo_renthub/views/shared/fonts/nunito.dart';
import 'package:gojo_renthub/views/shared/fonts/prata.dart';

class HomeScreen extends StatefulWidget {
  final PageController pageController;
  const HomeScreen({super.key, required this.pageController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MyPropertyRepo _repo = MyPropertyRepo();
  String categoryString = '';
  final List<House> houseList = [
    House(
        name: "Addis Ababa",
        houseImage: "assets/images/house.jpg",
        price: 800,
        bedroom: 12,
        bathroom: 12,
        long: 12.0,
        lat: 12.0,
        details: "2 beds 2 baths 1,200 sqft",
        type: HouseType.Apartment,
        locationName: "Piyassa"),
    House(
        name: "Addis Ababa",
        houseImage: "assets/images/house.jpg",
        price: 1200,
        bedroom: 12,
        bathroom: 12,
        long: 12.0,
        lat: 12.0,
        details: "3 beds 2 baths 1,200 sqft",
        type: HouseType.Condominium,
        locationName: "Piyasa"),
    House(
        name: "Addis Ababa",
        houseImage: "assets/images/house.jpg",
        price: 1000,
        bedroom: 12,
        bathroom: 12,
        long: 12.0,
        lat: 12.0,
        details: "4 beds 1 baths 1,200 sqft",
        type: HouseType.Hotel,
        locationName: "Asko"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            widget.pageController.jumpToPage(4);
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ));
                },
                icon: Icon(Icons.notifications,
                    color: Theme.of(context).colorScheme.onPrimary)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FirstSearchBar(
                pageController: widget.pageController,
              ),
              DefaultTabController(
                length: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TabBar(
                            isScrollable: true,
                            indicatorWeight: 6,
                            labelColor: Colors.teal,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: const Color(0xFF6055D8),
                            tabs: [
                              Tab(
                                icon: Text(
                                  'Apartment',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  'House',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  'Hotel',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  'Villa',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  'Condominium',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ]),
                        const Expanded(
                          child: TabBarView(children: [
                            Apartment(),
                            Houses(),
                            Hotel(),
                            Villas(),
                            Condominium(),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
