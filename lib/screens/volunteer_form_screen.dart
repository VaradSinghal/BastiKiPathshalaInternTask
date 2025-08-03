import 'package:basti_intern_task/models/volunteer_model.dart';
import 'package:basti_intern_task/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerFormScreen extends StatefulWidget {
  const VolunteerFormScreen({super.key});

  @override
  State<VolunteerFormScreen> createState() => _VolunteerFormScreenState();
}

class _VolunteerFormScreenState extends State<VolunteerFormScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final volunteer = Volunteer(
        name: _nameController.text,
        phone: _phoneController.text,
        city: _cityController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Thank you, ${volunteer.name}! We\'ll contact you soon.',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.teal.shade700,
          duration: const Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        _formKey.currentState?.reset();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Hero(
                  tag: 'volunteer-hero',
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Image.asset(
                      'assets/volunteer.png',
                      height: 180,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.volunteer_activism,
                          size: 80,
                          color: Colors.teal.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Join Our Volunteer Team',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Fill out the form below to join our mission of transforming lives.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: GoogleFonts.poppins(),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.teal.shade700,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: GoogleFonts.poppins(),
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: Colors.teal.shade700,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: GoogleFonts.poppins(),
                          prefixIcon: Icon(
                            Icons.location_city_outlined,
                            color: Colors.teal.shade700,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.teal.shade700,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style:
                              ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                                shadowColor: Colors.teal.shade200,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.teal.shade700,
                              ).copyWith(
                                overlayColor: MaterialStateProperty.all(
                                  Colors.teal.shade900,
                                ),
                              ),
                          child: Text(
                            'Submit Application',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Volunteer',
            tooltip: 'Volunteer Form',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.teal.shade200,
        backgroundColor: Colors.teal.shade700,
        selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.poppins(),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
