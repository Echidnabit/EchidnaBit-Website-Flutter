import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EchidnabitWebsiteApp());
}

class EchidnabitWebsiteApp extends StatelessWidget {
  const EchidnabitWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echidnabit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3454D1)),
        useMaterial3: true,
      ),
      initialRoute: Uri.base.path,
      onGenerateRoute: AppRouteFactory.generateRoute,
    );
  }
}

class AppRouteFactory {
  static const String home = '/';
  static const String privacyPolicy = '/privacy-policy';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final routeName = _normalizedRoute(routeSettings.name);

    switch (routeName) {
      case home:
        return _pageRoute(const HomePage());
      case privacyPolicy:
        return _pageRoute(const PrivacyPolicyPage());
      default:
        return _pageRoute(const HomePage());
    }
  }

  static String _normalizedRoute(String? routeName) {
    if (routeName == null || routeName.isEmpty) {
      return home;
    }

    final normalizedPath = Uri.parse(routeName).path;
    if (normalizedPath.isEmpty) {
      return home;
    }

    return normalizedPath;
  }

  static MaterialPageRoute<dynamic> _pageRoute(Widget page) {
    return MaterialPageRoute<dynamic>(builder: (_) => page);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<AppShowcase> appShowcases = [
    AppShowcase(
      name: 'Tessellate',
      description:
          'Tessellate lets artists split their pictures so creating repeatable tessellated art is quick and easy.',
      iconData: Icons.grid_view_rounded,
      accentColor: Color(0xFF4E79E6),
    ),
    AppShowcase(
      name: 'Pitchi',
      description:
          'Pitchi is a music learning companion targeted at musical students who want extra pitch training support.',
      iconData: Icons.music_note_rounded,
      accentColor: Color(0xFFE66D4E),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Echidnabit',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRouteFactory.privacyPolicy);
                    },
                    icon: const Icon(Icons.privacy_tip_outlined),
                    label: const Text('Privacy Policy'),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: const _HeroSection(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            sliver: SliverList.builder(
              itemCount: appShowcases.length,
              itemBuilder: (context, index) {
                final app = appShowcases[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AppShowcaseCard(app: app),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile app studio',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Building practical tools for creators and students.',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Echidnabit creates focused mobile apps that help people learn, make, and share better work.',
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () async {
                final contactUri = Uri(
                  scheme: 'mailto',
                  path: 'Echidnabit@gmail.com',
                  queryParameters: {'subject': 'Hello from echidnabit.com'},
                );
                await launchUrl(contactUri);
              },
              icon: const Icon(Icons.email_outlined),
              label: const Text('Contact me'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppShowcaseCard extends StatelessWidget {
  const AppShowcaseCard({super.key, required this.app});

  final AppShowcase app;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: app.accentColor.withValues(alpha: 0.14),
          child: Icon(app.iconData, color: app.accentColor),
        ),
        title: Text(
          app.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(app.description),
        ),
      ),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text(
            'Echidnabit Privacy Policy',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'This basic privacy policy explains how Echidnabit handles user data in our apps and on this website.',
          ),
          SizedBox(height: 16),
          Text('1. Data collection', style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Text(
            'Echidnabit aims to collect as little personal data as possible. If an app needs account, analytics, or crash reporting data, only the minimum required data is collected.',
          ),
          SizedBox(height: 16),
          Text('2. Data use', style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Text(
            'Any data collected is used to operate, maintain, and improve app features. We do not sell personal data.',
          ),
          SizedBox(height: 16),
          Text('3. Third-party services', style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Text(
            'Some apps may rely on trusted third-party services such as app stores, analytics, or cloud providers. Their privacy terms apply to data handled by those services.',
          ),
          SizedBox(height: 16),
          Text('4. Contact', style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Text('Questions can be sent to Echidnabit@gmail.com.'),
          SizedBox(height: 24),
          Text(
            'Last updated: 2026-02-21',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class AppShowcase {
  const AppShowcase({
    required this.name,
    required this.description,
    required this.iconData,
    required this.accentColor,
  });

  final String name;
  final String description;
  final IconData iconData;
  final Color accentColor;
}
