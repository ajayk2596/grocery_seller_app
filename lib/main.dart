import 'package:flutter/material.dart';
import 'package:grocery_seller_app/views/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}

// Dashboard Screen
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.store, size: 30, color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Store Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'store@email.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Products'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Product'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductAddScreen()),
                );
              },
            ),
            // Other Drawer Items
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Products Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOrderButton(context, 'All Products', Colors.red, _showProductsScreen),
                _buildOrderButton(context, 'Add Product', Colors.green, _showAddProductScreen),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Product',
          ),
        ],
      ),
    );
  }

  // Build Order Button
  Widget _buildOrderButton(BuildContext context, String title, Color color, Function() onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Show Products Screen
  void _showProductsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductListScreen()),
    );
  }

  // Show Add Product Screen
  void _showAddProductScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductAddScreen()),
    );
  }
}

// Product Add Screen
class ProductAddScreen extends StatelessWidget {
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String productName = '';
    String productDescription = '';
    double productPrice = 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) {
                  productName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Product Description'),
                onSaved: (value) {
                  productDescription = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  productPrice = double.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Add product to list or database here
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Product List Screen
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: ListView.builder(
        itemCount: 10,  // Replace with actual product count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product ${index + 1}'),
            subtitle: const Text('Product Description'),
            leading: const Icon(Icons.shopping_bag),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Handle product click
            },
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: GrocerySellerApp()
//     );
//   }
// }
//
//
//
//
//
//
//
// class GrocerySellerApp extends StatelessWidget {
//   const GrocerySellerApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grocery Seller',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         fontFamily: 'Poppins',
//         scaffoldBackgroundColor: Colors.grey[50],
//       ),
//       home: const LoginScreen(),
//     );
//   }
// }
//
// // Login Screen
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const SizedBox(height: 50),
//                 Image.asset(
//                   'assets/logo.png',
//                   height: 100,
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Welcome Back!',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     prefixIcon: const Icon(Icons.email),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   obscureText: _obscureText,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _obscureText = !_obscureText;
//                         });
//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // if (_formKey.currentState?.validate() ?? false) {
//                     //
//                     // }
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const DashboardScreen(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to registration
//                   },
//                   child: const Text('Don\'t have an account? Register'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Dashboard Screen
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.green,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.store, size: 30, color: Colors.green),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Store Name',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                   ),
//                   Text(
//                     'store@email.com',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.dashboard),
//               title: const Text('Dashboard'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.inventory),
//               title: const Text('Products'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.shopping_cart),
//               title: const Text('Orders'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.people),
//               title: const Text('Customers'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.local_shipping),
//               title: const Text('Delivery'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.analytics),
//               title: const Text('Analytics'),
//               onTap: () {},
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text('Settings'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Stats Cards
//             GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16,
//               childAspectRatio: 1.5,
//               children: [
//                 _buildStatsCard(
//                   'Total Sales',
//                   '₹45,231',
//                   Icons.currency_rupee,
//                   Colors.blue,
//                 ),
//                 _buildStatsCard(
//                   'Orders',
//                   '156',
//                   Icons.shopping_cart,
//                   Colors.orange,
//                 ),
//                 _buildStatsCard(
//                   'Products',
//                   '432',
//                   Icons.inventory,
//                   Colors.green,
//                 ),
//                 _buildStatsCard(
//                   'Customers',
//                   '1,204',
//                   Icons.people,
//                   Colors.purple,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             // Recent Orders
//             const Text(
//               'Recent Orders',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   child: ListTile(
//                     leading: const CircleAvatar(
//                       child: Icon(Icons.shopping_bag),
//                     ),
//                     title: Text('Order #${1001 + index}'),
//                     subtitle: Text('Customer Name ${index + 1}'),
//                     trailing: Chip(
//                       label: const Text('Pending'),
//                       backgroundColor: Colors.orange[100],
//                       labelStyle: TextStyle(
//                         color: Colors.orange[900],
//                       ),
//                     ),
//                     onTap: () {},
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.inventory),
//             label: 'Products',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatsCard(String title, String value, IconData icon, Color color) {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(
//               icon,
//               color: color,
//               size: 24,
//             ),
//             const Spacer(),
//             Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
