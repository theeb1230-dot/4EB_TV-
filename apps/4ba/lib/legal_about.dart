import 'package:flutter/material.dart';

/// In-product attribution required when TVmaze metadata discovery is enabled.
final class LegalAboutSurface extends StatelessWidget {
  const LegalAboutSurface({super.key});

  static const tvMazeUrl = 'https://www.tvmaze.com/';
  static const licenseUrl = 'https://creativecommons.org/licenses/by-sa/4.0/';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('حول وحقوق البيانات')),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: const [
              Text('4BA'),
              SizedBox(height: 16),
              Text(
                'يستخدم 4BA بيانات TVmaze للبيانات الوصفية والاكتشاف فقط.',
              ),
              SizedBox(height: 12),
              Text('TVmaze'),
              Text(tvMazeUrl),
              SizedBox(height: 12),
              Text('Creative Commons Attribution-ShareAlike 4.0'),
              Text(licenseUrl),
              SizedBox(height: 12),
              Text('TVmaze ليس مصدر بث أو تنزيل داخل 4BA.'),
            ],
          ),
        ),
      );
}
