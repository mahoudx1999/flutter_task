import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coffee_details_page.dart';

List<String> images = [
  "assets/Americano.jpg",
  "assets/Cappuccino.avif",
  "assets/Caramel Macchiato.jpg",
  "assets/Hot Chocolate.jpg",
  "assets/Irish Coffee.jpg",
  "assets/Mocha.jpg",
  "assets/Turkish Coffee.jpg",
];

List<String> descriptions = [
  "An Americano is crafted by carefully pouring hot water over a fresh double shot of espresso. This process softens the intense espresso taste while preserving its rich aroma and complex crema. It offers a smooth, balanced cup that gives you the bold flavor profile of espresso in a larger, easier-to-sip coffee format.",
  "A classic Italian cappuccino combines equal parts rich espresso, silky steamed milk, and a thick layer of airy milk foam. The top foam layer insulates the warmth, keeping every sip intensely aromatic. Crafted to perfection, it yields a creamy texture and a perfectly harmonious coffee experience from start to finish.",
  "Our Caramel Macchiato begins with fresh steamed milk combined with sweet vanilla syrup, marked by a fresh espresso shot poured over the top. Finished with a heavy drizzle of buttery caramel sauce, this multi-layered drink balances rich coffee notes with smooth, silky sweet flavors in every sip.",
  "Indulge in our rich Hot Chocolate, crafted from premium cocoa melted into fresh, steaming whole milk. It is blended to a velvety smoothness and finished with a cloud of freshly whipped cream. Perfect for cold mornings or warm evenings, it offers a deeply comforting and chocolatey treat.",
  "Irish Coffee blends rich, hot coffee with genuine Irish whiskey, balanced with a touch of brown sugar. Topped with a layer of cool, thick cream poured gently over the back of a spoon, you sip the hot, spiked coffee through the cool cream for a distinct blend of temperatures and flavors.",
  "The Mocha is a decadent combination of dark espresso, steamed milk, and rich chocolate sauce. Blended to create a smooth, velvety texture, it delivers a balance of bold roasted coffee and sweet cocoa, finished with a subtle dust of chocolate powder on top.",
  "Prepared using ultra-fine coffee grounds boiled directly in a traditional copper pot, Turkish Coffee is known for its strong, unfiltered taste and thick body. Infused with aromatic cardamom seeds, it is served hot with a rich layer of foam on top for a deeply authentic cultural experience.",
];

List<String> names = [
  "Americano",
  "Cappuccino",
  "Caramel Macchiato",
  "Hot Chocolate",
  "Irish Coffee",
  "Mocha",
  "Turkish Coffee",
];

List<String> additions = [
  "With Hot Water",
  "With Steamed Milk",
  "With Caramel Syrup",
  "With Whipped Cream",
  "With Dark Roast",
  "With Chocolate Syrup",
  "With Cardamom",
];

List<double> prices = [3.50, 4.00, 4.80, 4.20, 5.00, 4.50, 3.80];

List<String> categories = ['all', 'Cappuccino', 'Espresso', 'Latte'];

class CoffeeHomePage extends StatelessWidget {
  const CoffeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.apps, color: Color(0xFF4E545A)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person, color: Color(0xFF4E545A)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: const Color(0xFF0C0F14),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFD17842),
        unselectedItemColor: const Color(0xFF4E545A),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Find the best coffee for you',
                style: GoogleFonts.balsamiqSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF141921),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF52555A),
                  ),
                  hintText: 'Find your coffee...',
                  hintStyle: const TextStyle(color: Color(0xFF52555A)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFF141921)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFF141921)),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          categories[i],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: i == 0
                                ? const Color(0xFFD17842)
                                : const Color(0xFF52555A),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 310,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 7; i++)
                      myCoffeeCard(
                        context,
                        images[i],
                        names[i],
                        additions[i],
                        descriptions[i],
                        prices[i],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myCoffeeCard(
    BuildContext context,
    String image,
    String name,
    String addition,
    String description,
    double price,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeDetailsPage(
              image: image,
              name: name,
              addition: addition,
              description: description,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 20, bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF141921),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              addition,
              style: const TextStyle(fontSize: 14, color: Color(0xFF52555A)),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xFFD17842),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD17842),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
