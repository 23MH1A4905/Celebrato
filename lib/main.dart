import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => EventBookingApp()));
}

class EventBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Booking App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

//Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1519751138087-5bf79df62d5b?auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              'CELEBRATO',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4.0,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Login Page with full background image
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = '';

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => EventsListScreen()),
      );
    } else {
      setState(() {
        message = 'Please enter both email and password';
      });
    }
  }

  void goToSignup() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://th.bing.com/th/id/OIP.Z3xw5JkvShhJoks0zpZHxAHaEo?r=0&rs=1&pid=ImgDetMain',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      message,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: goToSignup,
                      child: Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Signup Page with full background image
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = '';

  void signup() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      setState(() {
        message = 'Signup successful! Please login.';
      });
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    } else {
      setState(() {
        message = 'Please fill all fields';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://th.bing.com/th/id/OIP.Z3xw5JkvShhJoks0zpZHxAHaEo?r=0&rs=1&pid=ImgDetMain',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: signup,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      message,
                      style: TextStyle(color: Colors.green[700], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Events List Screen
class EventsListScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "name": "Jaipur Literature Festival",
      "date": "15 July 2025",
      "location": "Jaipur, India",
      "description":
          "A celebration of literature and culture.The Jaipur Literature Festival is the world’s largest free literary festival, celebrating literature and ideas. It brings together authors, poets, and thinkers from around the globe to share stories and engage in thought-provoking discussions. A true cultural extravaganza for book lovers.",
      "image":
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "TechnoFest 2025",
      "date": "28 August 2025",
      "location": "Bangalore, India",
      "description":
          "Annual gathering of tech enthusiasts.Techno Fest showcases the latest innovations in technology and engineering. From robotics demonstrations to coding competitions, this event attracts tech enthusiasts and professionals eager to explore cutting-edge advancements. A hub for creativity and tech passion.",
      "image":
          "https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Music Mania",
      "date": "10 September 2025",
      "location": "Mumbai, India",
      "description":
          "Live performances by top artists.A vibrant celebration of music, the Music mania features performances by renowned artists and emerging talents across genres. With live concerts and interactive sessions, it’s a joyous experience for music lovers of all ages.",
      "image": "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4",
    },
    {
      "name": "Art Expo 2025",
      "date": "05 October 2025",
      "location": "Delhi, India",
      "description":
          "Showcase of contemporary art.Art Expo is a showcase of contemporary and traditional artworks by local and international artists. Visitors can admire paintings, sculptures, and installations, as well as participate in art workshops and meet the artists.",
      "image": "https://images.unsplash.com/photo-1511765224389-37f0e77cf0eb",
    },
    {
      "name": "Food Carnival",
      "date": "20 November 2025",
      "location": "Chennai, India",
      "description":
          "A feast of global cuisines.Food Carnival invites you on a culinary journey featuring cuisines from different cultures. With cooking demos, food stalls, and tasting sessions, it’s a paradise for food enthusiasts looking to indulge in diverse flavors.",
      "image": "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    },
    {
      "name": "Startup Summit",
      "date": "15 December 2025",
      "location": "Hyderabad, India",
      "description":
          "Networking for entrepreneurs.The Startup Summit connects budding entrepreneurs with investors and mentors. It features keynote speeches, workshops, and networking sessions designed to foster innovation and business growth. An excellent platform for startups to scale their ideas.",
      "image":
          "https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Film Festival",
      "date": "01 January 2026",
      "location": "Pune, India",
      "description":
          "Screenings of indie films.The Film Festival celebrates cinema from around the world, screening a diverse range of movies including documentaries, indie films, and blockbusters. It offers filmmakers a platform to showcase their work and audiences a chance to experience global storytelling.",
      "image":
          "https://images.unsplash.com/photo-1531058020387-3be344556be6?auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Health & Wellness Expo",
      "date": "10 February 2026",
      "location": "Kolkata, India",
      "description":
          "Promoting healthy living.Focused on holistic well-being, the Health & Wellness Fair offers seminars, fitness sessions, and health check-ups. It promotes a balanced lifestyle with expert advice on nutrition, mental health, and physical fitness.",
      "image": "https://images.unsplash.com/photo-1506126613408-eca07ce68773",
    },
    {
      "name": "Gaming Convention",
      "date": "25 March 2026",
      "location": "Gurgaon, India",
      "description":
          "Latest in gaming tech and esports.The Gaming Convention is a thrilling gathering of gamers, developers, and industry experts. Experience the latest video games, live tournaments, and exclusive game previews. It’s the ultimate event to connect with fellow gaming enthusiasts and celebrate gaming culture.",
      "image": "https://images.unsplash.com/photo-1511512578047-dfb367046420",
    },
    {
      "name": "Fashion Week",
      "date": "15 April 2026",
      "location": "New Delhi, India",
      "description":
          "Runway shows by top designers.Fashion Week is a glamorous event displaying the latest trends and designs from top fashion designers. With runway shows, exhibitions, and style talks, it is a must-attend for fashionistas and industry professionals alike.",
      "image":
          "https://images.unsplash.com/photo-1487412912498-0447578fcca8?auto=format&fit=crop&w=800&q=60",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upcoming Events 2025')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          var event = events[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetailsScreen(event: event),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        event["image"]!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event["name"]!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "${event["date"]} • ${event["location"]}",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          SizedBox(height: 8),
                          Text(
                            event["description"]!,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Event Details Screen
class EventDetailsScreen extends StatelessWidget {
  final Map<String, String> event;
  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event["name"] ?? "")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              event["image"] ?? "",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event["description"] ?? "",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 20),
                      SizedBox(width: 6),
                      Text(event["date"] ?? ""),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20),
                      SizedBox(width: 6),
                      Text(event["location"] ?? ""),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) =>
                                      BookingScreen(eventName: event["name"]!),
                            ),
                          );
                        },
                        child: Text('Book a Ticket'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to calendar!')),
                          );
                        },
                        child: Text('Add to Calendar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Booking Screen
class BookingScreen extends StatefulWidget {
  final String eventName;
  BookingScreen({required this.eventName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ticketsController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  void submitBooking() {
    String name = nameController.text;
    String tickets = ticketsController.text;
    String contact = contactController.text;

    if (name.isEmpty || tickets.isEmpty || contact.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text('Error'),
              content: Text('Please fill all the fields.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Booking Confirmed'),
            content: Text(
              'Thank you, $name! Your $tickets ticket(s) for "${widget.eventName}" have been booked.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Tickets')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: ticketsController,
              decoration: InputDecoration(labelText: 'Number of Tickets'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 25),
            ElevatedButton(onPressed: submitBooking, child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
