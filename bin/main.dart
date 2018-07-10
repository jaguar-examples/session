import 'package:jaguar/jaguar.dart';
import 'view.dart';

main() async {
  final server = new Jaguar(port: 10000);

  // Adds a phone to the Shopping Cart
  server.get('/cart/add/:phone', (ctx) async {
    final Session session = await ctx.session;  // Read current Session info
    final String newItem = ctx.pathParams['phone'];

    final List<String> items = (session['phones'] ?? '').split(',');

    if (!items.contains(newItem)) {
      items.add(newItem);
      session['phones'] = items.join(','); // Update Session info
    }

    return Redirect(Uri.parse('/'));
  });

  // Removes a phone from Shopping Cart
  server.get('/cart/remove/:phone', (ctx) async {
    final Session session = await ctx.session;
    final String newItem = ctx.pathParams['phone'];

    final List<String> items = (session['phones'] ?? '').split(',');

    if (items.contains(newItem)) {
      items.remove(newItem);
      session['phones'] = items.join(',');
    }

    return Redirect(Uri.parse('/'));
  });

  // HTML page for Shopping Cart
  server.html('/', (ctx) async {
    final Session session = await ctx.session;

    final List<String> items = (session['phones'] ?? '').split(',');

    return render(
        hasNexus: items.contains('nexus'),
        hasGalaxy: items.contains('galaxy'),
        hasIPhone: items.contains('iphone'));
  });

  server.log.onRecord.listen(print);
  await server.serve(logRequests: true);
}
