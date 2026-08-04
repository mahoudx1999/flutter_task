import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Drink_details_page.dart';
import 'model.dart';

List<String> categories = ['all', 'Cappuccino', 'Espresso', 'Latte'];

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  @override
  State<CoffeeHomePage> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0F14),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.apps, color: Color(0xFF4E545A)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person, color: Color(0xFF4E545A)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0C0F14),
        selectedItemColor: Color(0xFFD17842),
        unselectedItemColor: Color(0xFF4E545A),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Find the best drink for you',
                style: GoogleFonts.balsamiqSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF141921),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF52555A)),
                  hintText: 'Find your coffee...',
                  hintStyle: TextStyle(color: Color(0xFF52555A)),
                  // before start writing
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF141921)),
                  ),
                  // after start writing
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF141921)),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.0, left: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                categories[i],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == i
                                      ? Color(0xFFD17842)
                                      : Color(0xFF52555A),
                                ),
                              ),
                              SizedBox(height: 4),
                              if (selectedIndex == i)
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD17842),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 310,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < DrinkList.length; i++)
                      myDrinkCard(context, DrinkList[i]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDrinkCard(BuildContext context, Drink coffee) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DrinkDetailsPage(coffee: coffee),
          ),
        );
      },
      child: Container(
        width: 170,
        margin: EdgeInsets.only(right: 20, bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF141921),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                coffee.image,
                height: 150,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 12),
            Text(
              coffee.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              coffee.addition,
              style: TextStyle(fontSize: 14, color: Color(0xFF52555A)),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${coffee.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0xFFD17842),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFD17842),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
