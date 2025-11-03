// Calculator Page
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double _monthlyBill = 3000;
  String _selectedSystem = '3kW';
  
  Map<String, Map<String, dynamic>> systemData = {
    '3kW': {'emi': 3100, 'savings': 5000, 'cost': 180000},
    '4kW': {'emi': 4200, 'savings': 7000, 'cost': 240000},
    '5kW': {'emi': 5300, 'savings': 11000, 'cost': 300000},
  };

  @override
  Widget build(BuildContext context) {
    final data = systemData[_selectedSystem]!;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solar Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calculate Your Savings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Monthly Electricity Bill',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${_monthlyBill.round()}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF101d8b),
                      ),
                    ),
                    Slider(
                      value: _monthlyBill,
                      min: 1000,
                      max: 20000,
                      divisions: 38,
                      activeColor: const Color(0xFF101d8b),
                      onChanged: (value) {
                        setState(() {
                          _monthlyBill = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recommended System Size',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: '3kW', label: Text('3kW')),
                ButtonSegment(value: '4kW', label: Text('4kW')),
                ButtonSegment(value: '5kW', label: Text('5kW')),
              ],
              selected: {_selectedSystem},
              onSelectionChanged: (Set<String> selection) {
                setState(() {
                  _selectedSystem = selection.first;
                });
              },
            ),
            const SizedBox(height: 24),
            Card(
              color: const Color(0xFF101d8b).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Your Investment Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSummaryRow('System Cost', '₹${data['cost']}'),
                    _buildSummaryRow('Monthly EMI (5 years)', '₹${data['emi']}'),
                    _buildSummaryRow('Monthly Savings', '₹${data['savings']}+'),
                    _buildSummaryRow('Net Monthly Benefit', 
                        '₹${data['savings'] - data['emi']}'),
                    const Divider(height: 32),
                    _buildSummaryRow('25 Year Savings', 
                        '₹${(data['savings'] * 12 * 25).toString()}', 
                        isHighlight: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Book Free Assessment'),
                      content: const Text(
                        'Our solar expert will contact you within 24 hours to schedule a free rooftop assessment.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Assessment booked successfully!'),
                              ),
                            );
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'BOOK FREE ASSESSMENT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isHighlight ? 16 : 14,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isHighlight ? 20 : 16,
              fontWeight: FontWeight.bold,
              color: isHighlight ? const Color(0xFF101d8b) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}