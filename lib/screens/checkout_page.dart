import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/providers/auth_provider.dart';
import 'package:textile_mobile_app/providers/cart_provider.dart';
import 'package:textile_mobile_app/providers/order_provider.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _confirmAddressMode = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = context.read<AuthProvider>().user;
      if (user == null) return;
      _addressController.text = user.address;
      _cityController.text = user.city;
      _phoneController.text = user.phone;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final user = context.watch<AuthProvider>().user;
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Checkout',
        onGoHome: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Delivery Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              if (user != null && user.address.isNotEmpty)
                SwitchListTile(
                  value: _confirmAddressMode,
                  onChanged: (value) =>
                      setState(() => _confirmAddressMode = value),
                  title: const Text('Confirm saved delivery address'),
                  subtitle: Text(user.address),
                ),
              if (!_confirmAddressMode || (user?.address.isEmpty ?? true)) ...[
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Enter address' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Enter city' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) => (value == null || value.length < 6)
                      ? 'Enter valid phone'
                      : null,
                ),
              ],
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF171717),
                  border: Border.all(color: const Color(0xFF313131)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.payments_outlined),
                    SizedBox(width: 8),
                    Text('Payment: Cash on Delivery (COD)'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total: \$${cartProvider.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if ((!_confirmAddressMode ||
                            (user?.address.isEmpty ?? true)) &&
                        !_formKey.currentState!.validate()) {
                      return;
                    }
                    final selectedAddress = _confirmAddressMode && user != null
                        ? '${user.address}, ${user.city}, Phone: ${user.phone}'
                        : '${_addressController.text.trim()}, ${_cityController.text.trim()}, Phone: ${_phoneController.text.trim()}';
                    final address = selectedAddress;
                    context.read<OrderProvider>().placeOrder(
                      cartItems: cartProvider.items,
                      deliveryAddress: address,
                    );
                    context.read<CartProvider>().clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order placed successfully'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Place Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
