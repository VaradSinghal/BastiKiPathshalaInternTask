import 'package:basti_intern_task/screens/volunteer_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'ngo-logo',
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Transforming Lives Through Education',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'About Basti Ki Pathshala',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Basti Ki Pathshala is a non-profit dedicated to empowering underprivileged children in urban slums through quality education and holistic development. '
                        'Our vision is to break the cycle of poverty by nurturing confident, capable, and compassionate individuals. '
                        'Since our inception in 2015, we have transformed the lives of over 5,000 children across 10 cities.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
  
              Text(
                'Our Impact',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildStatCard(
                    context: context,
                    title: '5,000+',
                    subtitle: 'Children Educated',
                    color: Colors.teal.shade600,
                  ),
                  _buildStatCard(
                    context: context,
                    title: '10+',
                    subtitle: 'Cities Reached',
                    color: Colors.blue.shade600,
                  ),
                  _buildStatCard(
                    context: context,
                    title: '500+',
                    subtitle: 'Volunteers',
                    color: Colors.green.shade600,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Our Pillars',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildFeatureCard(
                    context: context,
                    icon: Icons.school,
                    title: 'Education',
                    description: 'Providing free, quality education to children in need.',
                    color: Colors.blue.shade600,
                  ),
                  _buildFeatureCard(
                    context: context,
                    icon: Icons.favorite,
                    title: 'Care',
                    description: 'Ensuring holistic care and emotional support.',
                    color: Colors.red.shade600,
                  ),
                  _buildFeatureCard(
                    context: context,
                    icon: Icons.people,
                    title: 'Community',
                    description: 'Building strong, inclusive communities.',
                    color: Colors.green.shade600,
                  ),
                  _buildFeatureCard(
                    context: context,
                    icon: Icons.lightbulb,
                    title: 'Empowerment',
                    description: 'Empowering youth with skills for the future.',
                    color: Colors.orange.shade600,
                  ),
                ],
              ),
              const SizedBox(height: 32),
          
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const VolunteerFormScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Join Our Mission',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home Screen',
            backgroundColor: Colors.teal.shade700,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_add),
            label: 'Volunteer',
            tooltip: 'Volunteer Form',
            backgroundColor: Colors.teal.shade700,
          ),
        ],
        currentIndex: 0, 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.teal.shade200,
        backgroundColor: Colors.teal.shade700,
        selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.poppins(),
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const VolunteerFormScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }

  Widget _buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width * 0.28,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}