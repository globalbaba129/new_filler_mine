import 'package:flutter/material.dart';

class BusinessIncorporationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.yellow),
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
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.person_outline, color: Colors.grey[800]),
                      SizedBox(width: 8.0),
                      Text(
                        'Mudassir Khan',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Business Incorporation',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Mudassir Khan, Please Select The Option Best Suited To You',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIncorporationOption(
                  icon: Icons.groups_outlined,
                  label: 'AOP /\nPartnership',
                  onTap: () {
                    // Handle AOP/Partnership selection
                    print('Tapped: AOP / Partnership');
                  },
                ),
                _buildIncorporationOption(
                  icon: Icons.person_pin_outlined,
                  label: 'Sole Proprietor\nNTN',
                  onTap: () {
                    // Handle Sole Proprietor NTN selection
                    print('Tapped: Sole Proprietor NTN');
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIncorporationOption(
                  icon: Icons.insert_chart_outlined,
                  label: 'Add Business\nTo NTN',
                  onTap: () {
                    // Handle Add Business To NTN selection
                    print('Tapped: Add Business To NTN');
                  },
                ),
                _buildIncorporationOption(
                  icon: Icons.format_list_bulleted_outlined,
                  label: 'Remove\nBusiness To\nNTN',
                  onTap: () {
                    // Handle Remove Business To NTN selection
                    print('Tapped: Remove Business To NTN');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncorporationOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160.0, // Adjust width as needed
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.yellow, size: 40.0),
            SizedBox(height: 8.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}