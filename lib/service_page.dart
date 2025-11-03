// Services Page
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildServiceCard(
            'Solar Installation',
            'Professional installation with 25-year warranty',
            Icons.construction,
            context,
          ),
          _buildServiceCard(
            'Free Assessment',
            'Get expert consultation for your rooftop',
            Icons.assessment,
            context,
          ),
          _buildServiceCard(
            'Maintenance',
            'Regular maintenance and cleaning services',
            Icons.build,
            context,
          ),
          _buildServiceCard(
            'Monitoring',
            'Real-time monitoring of your solar system',
            Icons.monitor,
            context,
          ),
          _buildServiceCard(
            'Subsidy Assistance',
            'Help with government subsidy applications',
            Icons.attach_money,
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String description,
    IconData icon,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF101d8b).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF101d8b),
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
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