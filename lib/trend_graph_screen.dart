











/*


import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrendGraphScreen extends StatelessWidget {
  const TrendGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ginger Price Trends in Sri Lanka"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📈 Ginger Price Trends (Sept 2024 - Feb 2025)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 50),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text("Sept");
                            case 1:
                              return const Text("Oct");
                            case 2:
                              return const Text("Nov");
                            case 3:
                              return const Text("Dec");
                            case 4:
                              return const Text("Jan");
                            case 5:
                              return const Text("Feb");
                            default:
                              return const Text("");
                          }
                        },
                        reservedSize: 30,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.grey)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 800),  // September 2024 - 800 RS/kg
                        FlSpot(1, 820),  // October 2024 - 820 RS/kg
                        FlSpot(2, 850),  // November 2024 - 850 RS/kg
                        FlSpot(3, 870),  // December 2024 - 870 RS/kg
                        FlSpot(4, 890),  // January 2025 - 890 RS/kg
                        FlSpot(5, 860),  // February 2025 - 860 RS/kg
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.green.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                " Current Predicted Price: RS 860/kg (Feb 2025)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/






import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrendGraphScreen extends StatelessWidget {
  const TrendGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ginger Price Trends in Sri Lanka"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "\ud83d\udcc8 Ginger Price Trends (Dec 2024 - May 2025)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 50),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text("Dec");
                            case 1:
                              return const Text("Jan");
                            case 2:
                              return const Text("Feb");
                            case 3:
                              return const Text("Mar");
                            case 4:
                              return const Text("Apr");
                            case 5:
                              return const Text("May");
                            default:
                              return const Text("");
                          }
                        },
                        reservedSize: 30,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.grey)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 870),  // Dec 2024
                        FlSpot(1, 890),  // Jan 2025
                        FlSpot(2, 860),  // Feb 2025
                        FlSpot(3, 880),  // Mar 2025
                        FlSpot(4, 900),  // Apr 2025
                        FlSpot(5, 910),  // May 2025
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.green.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                " Current Predicted Price will be: RS 910/kg (May 2025)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



