import 'package:cafe_signal/screens/app_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Café_Signal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeView(),
    );
  }
}

const kGradientBackgroundColor = LinearGradient(
  colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243E)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Soth Hengipor"),
              accountEmail: Text("sothhengipor999@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlpxMx7qc7nyn3uiEXmk869hZamh_hfWrYsw&s",
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text("Notifications"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
        backgroundColor: Colors.brown[200],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 10),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(1, 0))],
            ),
            child: Image.network(
              "https://www.training.com.au/wp-content/uploads/Full-Stack-Developer-1.jpeg",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Welcome to Café_Signal",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown[400],
            ),
          ),
          Text(
            "Learn Flutter with us and build amazing apps!",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[300],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Get Started",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          // login form
          SizedBox(height: 30),
          // button click to page LoginScreen
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[300],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Go to Login",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
