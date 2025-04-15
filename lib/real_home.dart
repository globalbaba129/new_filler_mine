import 'package:flutter/material.dart';
import 'IRIS.dart';
import 'NTNfinder.dart'; // Import the NTNFinderScreen
import 'E-Service.dart';
import 'NTN_Registration.dart';
import 'Taxpayer.dart';
import 'GSTnRegistration.dart';


class HomeScreen extends StatelessWidget {
  // Sample data for the grid items with correct labels
  final List<Map<String, dynamic>> gridItems = [
    {'icon': Icons.description_outlined, 'label': 'E-Services\nTax_Filing'},
    {'icon': Icons.assignment_ind_outlined, 'label': 'NTN\nRegistration'},
    {'icon': Icons.folder_outlined, 'label': 'NTN\nFinder'},
    {'icon': Icons.person_pin_outlined, 'label': 'IRIS Profile\nUpdate'},
    {'icon': Icons.search_outlined, 'label': 'ATL Business\nFinder'},
    {'icon': Icons.update_outlined, 'label': 'WHT Active\nTaxpayer\Update'},
    {'icon': Icons.business_center_outlined, 'label': 'Business\nIncorporation'},
    {'icon': Icons.card_membership_outlined, 'label': 'GST\nRegistration'},
    {'icon': Icons.location_on_outlined, 'label': 'USA\nInquiries'},
    {'icon': Icons.calculate_outlined, 'label': 'Salary\nCalculator'},
    {'icon': Icons.receipt_outlined, 'label': 'Expenses\nTracker'},
    {'icon': Icons.play_circle_outline, 'label': 'Videos'},
    {'icon': Icons.book_outlined, 'label': 'Blogs'},
    {'icon': Icons.question_mark_outlined, 'label': 'FAQ'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // Adjust threshold as needed
    final gridCrossAxisCount = isSmallScreen ? 4 : 6; // Adjust grid columns based on screen width
    final horizontalPadding = 16.0;
    final smallIconSize = 24.0; // Define the smaller icon size

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: Icon(Icons.call, color: Colors.yellow),
          onPressed: () {
            // Handle call action
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
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Make children take full width
          children: [
            // Top Section
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
                      Icon(Icons.person, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text('Mudassir Khan', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text('Total Balance', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('Rs 3,20,000', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('+ Add Income', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              Text('Rs 3,20,000', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('+ Add Expenses', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              Text('Rs 3,20,000', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Text('Popular News', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            // Dynamic Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCrossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0, // Make grid items square for better fit
              ),
              itemCount: gridItems.length,
              itemBuilder: (context, index) {
                final item = gridItems[index];
                return InkWell( // Use InkWell for tap gesture and visual feedback
                  onTap: () {
                    if (item['label'] == 'IRIS Profile\nUpdate') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IrisProfileUpdateScreen()),
                      );
                    } else if (item['label'] == 'NTN\nFinder') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NTNFinderScreen()),
                      );
                    }  else if (item['label'] == 'E-Services\nTax_Filing') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BusinessIncorporationScreen()),
                      );
                    } else if (item['label'] == 'NTN\nRegistration') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NTNRegistrationPage()),
                      );
                    } else if (item['label'] == 'WHT Active\nTaxpayer\Update') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ATLStatusInquiryScreen()),
                      );
                    } else if (item['label'] == 'GST\nRegistration') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GSTRegistrationScreen()),
                      );
                    }

                    else {
                      // Handle taps for other icons if needed
                      print('Tapped: ${item['label']}');
                      // You can add navigation or other actions for other buttons here
                      // Example for another item:
                      // if (item['label'] == 'E-Services\nTax Filing') {
                      //   // Navigate to E-Services Tax Filing screen
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => ESrvicesTaxFilingScreen()),
                      //   );
                      // }
                    }
                  },
                  child: Container(
                    width: 50.0, // Add width here
                    height: 50.0, // Add height here
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], color: Colors.yellow, size: smallIconSize),
                        SizedBox(height: 4.0),
                        Text(
                          item['label'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 10.0,
                            color: Colors.white, // Set the text color to white here
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 24.0),
            Text('Other Sections', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            // Add more UI elements below the grid as in your image
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('News Item 1', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('News Item 2', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('News Item 3', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text('News Item 4', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}