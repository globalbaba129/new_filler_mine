import 'package:flutter/material.dart';

class IrisProfileUpdateScreen extends StatelessWidget {
  final List<Map<String, dynamic>> incomeSources = [
    {'icon': Icons.attach_money, 'label': 'Salary'},
    {'icon': Icons.home_outlined, 'label': 'Rental Income'},
    {'icon': Icons.widgets_outlined, 'label': 'Capital Assets'},
    {'icon': Icons.grass_outlined, 'label': 'Agriculture'},
    {'icon': Icons.language_outlined, 'label': 'Foreign'},
    {'icon': Icons.more_horiz_outlined, 'label': 'Other Sources'},
    {'icon': Icons.local_atm_outlined, 'label': 'Business Income'},
    {'icon': Icons.money_off_outlined, 'label': 'No Source Of Income'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow), // Added the color property
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text('Mudassir Khan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text('IRIS Profile Update', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Text(
                    'Please Follow The Process To Update Your NTN Particulars With FBR',
                    style: TextStyle(color: Colors.black87, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 0.85,
              ),
              itemCount: incomeSources.length,
              itemBuilder: (context, index) {
                final source = incomeSources[index];
                return InkWell(
                  onTap: () {
                    // Handle income source selection
                    print('Selected: ${source['label']}');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(source['icon'], color: Colors.yellow, size: 32.0),
                        SizedBox(height: 8.0),
                        Text(
                          source['label'],
                          textAlign: TextAlign.center,

                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Use backgroundColor instead of primary
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Handle continue button action
                print('Continue button pressed'); // Add your desired action here
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}