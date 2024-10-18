import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Seller'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search for groceries',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality
                    },
                  ),
                ),
              ),
            ),

            // Orders Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            OrderSection(title: 'All Orders', orderCount: 10),
            OrderSection(title: 'Pending Orders', orderCount: 5),
            OrderSection(title: 'Processing Orders', orderCount: 3),
            OrderSection(title: 'Recent Orders', orderCount: 2),

            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 8, // Number of featured products
              itemBuilder: (context, index) {
                return ProductCard(
                  title: 'Product $index',
                  price: '\$${(index + 1) * 5}',
                  imageUrl: 'assets/sample_product.png', // Replace with actual image path
                );
              },
            ),
            
            Image.asset('assets/images/logo.jpg')
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add product screen or any quick action
          Get.to(() => AddProductScreen());
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Product',
      ),
    );
  }
}

// Widget for Order Section
class OrderSection extends StatelessWidget {
  final String title;
  final int orderCount;

  const OrderSection({required this.title, required this.orderCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to order details screen (replace with your implementation)
        Get.to(() => OrderDetailsScreen(title: title));
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(title),
          trailing: Text('$orderCount'),
          leading: Icon(Icons.assignment),
        ),
      ),
    );
  }
}

// Widget for Product Card
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({required this.title, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.asset(imageUrl, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Sample Cart Screen (Replace with actual implementation)
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Center(child: const Text('Your cart is empty!')),
    );
  }
}

// Sample Order Details Screen (Replace with actual implementation)
class OrderDetailsScreen extends StatelessWidget {
  final String title;

  const OrderDetailsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Details for $title')),
    );
  }
}

// Sample Add Product Screen (Replace with actual implementation)
class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Center(child: const Text('Add your product here!')),
    );
  }
}

//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>(); // Key to validate the form
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   bool _obscurePassword = true; // For password visibility toggle
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Email Field
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//
//               // Password Field
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//
//               // Login Button
//               ElevatedButton(
//                 onPressed: _login,
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 16),
//
//               // Navigate to Signup
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                    // Get.to(() => SignUpScreen()); // Navigate to Signup screen
//                   },
//                   child: const Text("Don't have an account? Sign Up"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       // Implement your login process here (e.g., call API to authenticate user)
//       // Example: final response = await AuthService.login(
//       //   email: _emailController.text,
//       //   password: _passwordController.text,
//       // );
//
//       // After successful login, navigate to the home screen
//       // Get.offAll(() => HomeScreen());
//
//       // For now, just showing a success message
//       Get.snackbar('Success', 'Logged in successfully!');
//     }
//   }
// }
//

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>(); // Key to validate the form
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   bool _obscurePassword = true; // For password visibility toggle
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Name Field
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//
//               // Email Field
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//
//               // Password Field
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//
//               // Confirm Password Field
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your password';
//                   }
//                   if (value != _passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//
//               // Sign Up Button
//               ElevatedButton(
//                 onPressed: _signUp,
//                 child: const Text('Sign Up'),
//               ),
//               const SizedBox(height: 16),
//
//               // Navigate to Login
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Get.back(); // Navigate back to the previous screen (e.g., Login)
//                   },
//                   child: const Text('Already have an account? Login'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _signUp() {
//     if (_formKey.currentState!.validate()) {
//       // Implement your signup process here (e.g., call API to register user)
//       // Example: final response = await AuthService.signUp(
//       //   name: _nameController.text,
//       //   email: _emailController.text,
//       //   password: _passwordController.text,
//       // );
//
//       // After successful registration, navigate to the home screen
//       // Get.offAll(() => HomeScreen());
//
//       // For now, just showing a success message
//       Get.snackbar('Success', 'Account created successfully!');
//     }
//   }
// }
