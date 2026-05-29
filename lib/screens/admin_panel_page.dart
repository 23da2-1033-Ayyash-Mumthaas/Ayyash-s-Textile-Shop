import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:textile_mobile_app/app/firebase_providers.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/data/models/banner_model.dart';
import 'package:textile_mobile_app/data/models/category_model.dart';
import 'package:textile_mobile_app/data/models/offer_model.dart';
import 'package:textile_mobile_app/data/models/order_model.dart';
import 'package:textile_mobile_app/data/models/product_model.dart';
import 'package:textile_mobile_app/data/models/product_variant.dart';
import 'package:textile_mobile_app/utils/firestore_helpers.dart';
import 'package:textile_mobile_app/data/models/user_model.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Admin Panel',
        onGoHome: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF0D0D0D),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.amber.shade700,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'Dashboard'),
                Tab(text: 'Products'),
                Tab(text: 'Orders'),
                Tab(text: 'Categories'),
                Tab(text: 'Banners'),
                Tab(text: 'Offers'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                _DashboardTab(),
                _ProductsTab(),
                _OrdersTab(),
                _CategoriesTab(),
                _BannersTab(),
                _OffersTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
      builder: (context, ref, _) {
        final products = ref.watch(allProductsStreamProvider).valueOrNull ?? [];
        final orders = ref.watch(allOrdersStreamProvider).valueOrNull ?? [];
        final users = ref.watch(_usersSnapshotProvider).valueOrNull ?? [];
        final settings = ref.watch(appSettingsStreamProvider).valueOrNull;

        final activeProducts = products.where((p) => p.isActive).length;
        final totalRevenue = orders.fold(0.0, (t, o) => t + o.total);
        final pendingOrders = orders
            .where((o) => o.status == OrderStatus.placed)
            .length;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Store Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade300,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    icon: Icons.inventory_2,
                    label: 'Products',
                    value: '$activeProducts',
                    sub: '${products.length} total',
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MetricCard(
                    icon: Icons.receipt_long,
                    label: 'Orders',
                    value: '${orders.length}',
                    sub: '$pendingOrders pending',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    icon: Icons.people,
                    label: 'Customers',
                    value: '${users.length}',
                    sub: 'registered',
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MetricCard(
                    icon: Icons.attach_money,
                    label: 'Revenue',
                    value: '\$${totalRevenue.toStringAsFixed(0)}',
                    sub: settings?.currency ?? 'PKR',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Recent Orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.amber.shade200,
              ),
            ),
            const SizedBox(height: 8),
            ...orders
                .take(5)
                .map(
                  (o) => Card(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: ListTile(
                      dense: true,
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _statusColor(o.status).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '#${o.id.substring(0, 4)}',
                            style: TextStyle(
                              fontSize: 10,
                              color: _statusColor(o.status),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '\$${o.total.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '${o.items.length} item(s)  |  ${o.status.name}',
                      ),
                      trailing: Text(
                        o.placedAt != null
                            ? '${DateTime.now().difference(o.placedAt!).inDays}d ago'
                            : '',
                      ),
                    ),
                  ),
                ),
          ],
        );
      },
    );
  }
}

final _usersSnapshotProvider = riverpod.FutureProvider<List<UserModel>>((ref) {
  return FirebaseFirestore.instance
      .collection(FirestorePaths.users)
      .get()
      .then(
        (s) => s.docs.map((d) => UserModel.fromJson(d.dataWithId())).toList(),
      );
});

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.sub,
    required this.color,
  });
  final IconData icon;
  final String label, value, sub;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2F2F2F)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sub,
                style: const TextStyle(color: Colors.white38, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductsTab extends StatelessWidget {
  const _ProductsTab();

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
      builder: (context, ref, _) {
        final async = ref.watch(allProductsStreamProvider);
        return async.when(
          data: (products) => _ProductsBody(products: products),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        );
      },
    );
  }
}

class _ProductsBody extends StatelessWidget {
  const _ProductsBody({required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: const Color(0xFF0D0D0D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${products.length} Products',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showForm(context, null),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber.shade800,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: products.isEmpty
              ? const Center(child: Text('No products'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: products.length,
                  itemBuilder: (_, i) => _ProductTile(
                    product: products[i],
                    onEdit: () => _showForm(context, products[i]),
                    onDelete: () => _confirmDelete(context, products[i]),
                  ),
                ),
        ),
      ],
    );
  }

  void _showForm(BuildContext context, ProductModel? p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _ProductForm(product: p),
    );
  }

  void _confirmDelete(BuildContext context, ProductModel p) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text('Delete Product'),
        content: Text(
          'Deactivate "${p.name}"? It will be hidden from customers.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection(FirestorePaths.products)
                  .doc(p.id)
                  .update({'isActive': false});
              Navigator.pop(context);
            },
            child: const Text('Deactivate'),
          ),
        ],
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });
  final ProductModel product;
  final VoidCallback onEdit, onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.primaryImageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 56,
                  height: 56,
                  color: Colors.grey[850],
                  child: const Icon(Icons.image, color: Colors.white38),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}  |  Stock: ${product.stockTotal}',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  if (product.isFeatured || product.isTrending)
                    Row(
                      children: [
                        if (product.isFeatured)
                          Container(
                            margin: const EdgeInsets.only(right: 4, top: 2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Featured',
                              style: TextStyle(fontSize: 9, color: Colors.blue),
                            ),
                          ),
                        if (product.isTrending)
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Trending',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: product.isActive
                        ? Colors.green.withValues(alpha: 0.2)
                        : Colors.red.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    product.isActive ? Icons.check_circle : Icons.block,
                    size: 16,
                    color: product.isActive ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: onEdit,
                      borderRadius: BorderRadius.circular(6),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onDelete,
                      borderRadius: BorderRadius.circular(6),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.delete_outline,
                          size: 18,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductForm extends StatefulWidget {
  const _ProductForm({this.product});
  final ProductModel? product;
  @override
  State<_ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<_ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _imageCtrl;
  late TextEditingController _stockCtrl;
  String _category = 'Men';
  bool _isFeatured = false;
  bool _isTrending = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _nameCtrl = TextEditingController(text: p?.name ?? '');
    _priceCtrl = TextEditingController(
      text: p != null ? p.price.toStringAsFixed(2) : '',
    );
    _descCtrl = TextEditingController(text: p?.description ?? '');
    _imageCtrl = TextEditingController(text: p?.primaryImageUrl ?? '');
    _stockCtrl = TextEditingController(
      text: p != null ? '$p.stockTotal' : '50',
    );
    _category = p?.categoryName.isNotEmpty == true ? p!.categoryName : 'Men';
    _isFeatured = p?.isFeatured ?? false;
    _isTrending = p?.isTrending ?? false;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _descCtrl.dispose();
    _imageCtrl.dispose();
    _stockCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Men',
      'Women',
      'Kids',
      'Footwear',
      'Accessories',
      'Ethnic',
    ];
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product == null ? 'Add Product' : 'Edit Product',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (_imageCtrl.text.isNotEmpty)
                Container(
                  height: 120,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(_imageCtrl.text),
                      fit: BoxFit.cover,
                      onError: (_, _) {},
                    ),
                  ),
                ),
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Product Name *',
                  hintText: 'e.g. Classic Cotton T-Shirt',
                ),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Price *',
                        prefixText: '\$ ',
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Required';
                        if (double.tryParse(v) == null) return 'Invalid';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _stockCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Stock'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descCtrl,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Brief product description',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _imageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                  hintText: 'https://...',
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => _category = v ?? 'Men'),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: _isFeatured,
                      onChanged: (v) =>
                          setState(() => _isFeatured = v ?? false),
                      title: const Text(
                        'Featured',
                        style: TextStyle(fontSize: 14),
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      value: _isTrending,
                      onChanged: (v) =>
                          setState(() => _isTrending = v ?? false),
                      title: const Text(
                        'Trending',
                        style: TextStyle(fontSize: 14),
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: _saving ? null : _save,
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber.shade800,
                  ),
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          widget.product == null
                              ? 'Create Product'
                              : 'Save Changes',
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final db = FirebaseFirestore.instance;
      final id =
          widget.product?.id ?? 'p_${DateTime.now().millisecondsSinceEpoch}';
      final price = double.parse(_priceCtrl.text);
      final stock = int.tryParse(_stockCtrl.text) ?? 0;
      final slug = _nameCtrl.text.trim().toLowerCase().replaceAll(
        RegExp(r'\s+'),
        '-',
      );

      final variants = (widget.product?.variants ?? []).isEmpty
          ? ProductModel(
                  id: id,
                  name: _nameCtrl.text.trim(),
                  price: price,
                  categoryName: _category,
                ).availableSizes
                .map(
                  (s) => ProductVariant(
                    id: '${id}_$s',
                    sku: '$id-$s',
                    size: s,
                    stock: 25,
                  ),
                )
                .toList()
          : widget.product!.variants;

      await db.collection(FirestorePaths.products).doc(id).set({
        'name': _nameCtrl.text.trim(),
        'slug': slug,
        'description': _descCtrl.text.trim(),
        'categoryName': _category,
        'price': price,
        'currency': 'PKR',
        'imageUrls': [_imageCtrl.text.trim()],
        'variants': variants.map((v) => v.toJson()).toList(),
        'tags': [_category.toLowerCase()],
        'weightKg': _category == 'Footwear' ? 0.8 : 0.4,
        'isFeatured': _isFeatured,
        'isTrending': _isTrending,
        'isActive': true,
        'stockTotal': stock,
        'ratingAvg': widget.product?.ratingAvg ?? 0,
        'ratingCount': widget.product?.ratingCount ?? 0,
        if (widget.product == null) 'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      if (mounted) navigator.pop(context);
    } catch (e) {
      if (mounted) {
        messenger.showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _OrdersTab extends StatelessWidget {
  const _OrdersTab();

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
      builder: (context, ref, _) {
        final async = ref.watch(allOrdersStreamProvider);
        return async.when(
          data: (orders) => _OrdersBody(orders: orders),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        );
      },
    );
  }
}

class _OrdersBody extends StatefulWidget {
  const _OrdersBody({required this.orders});
  final List<OrderModel> orders;
  @override
  State<_OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<_OrdersBody> {
  String _search = '';
  OrderStatus? _filter;

  List<OrderModel> get _filtered {
    var result = widget.orders;
    if (_filter != null) {
      result = result.where((o) => o.status == _filter).toList();
    }
    if (_search.isNotEmpty) {
      final q = _search.toLowerCase();
      result = result
          .where(
            (o) =>
                o.id.toLowerCase().contains(q) ||
                o.deliveryAddress.city.toLowerCase().contains(q),
          )
          .toList();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
          color: const Color(0xFF0D0D0D),
          child: Column(
            children: [
              TextField(
                onChanged: (v) => setState(() => _search = v),
                decoration: const InputDecoration(
                  hintText: 'Search by order ID or city',
                  prefixIcon: Icon(Icons.search, size: 20),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _filterChip('All', null),
                    ...OrderStatus.values.map((s) => _filterChip(s.name, s)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _filtered.isEmpty
              ? const Center(child: Text('No orders match'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _filtered.length,
                  itemBuilder: (_, i) => _OrderTile(order: _filtered[i]),
                ),
        ),
      ],
    );
  }

  Widget _filterChip(String label, OrderStatus? status) {
    final selected = _filter == status;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ChoiceChip(
        label: Text(label, style: const TextStyle(fontSize: 12)),
        selected: selected,
        onSelected: (_) => setState(() => _filter = status),
        selectedColor: Colors.amber.shade800,
        backgroundColor: const Color(0xFF1A1A1A),
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

Color _statusColor(OrderStatus s) {
  switch (s) {
    case OrderStatus.placed:
      return Colors.blue;
    case OrderStatus.processing:
      return Colors.orange;
    case OrderStatus.shipped:
      return Colors.purple;
    case OrderStatus.delivered:
      return Colors.green;
    case OrderStatus.cancelled:
      return Colors.red;
  }
}

class _OrderTile extends StatelessWidget {
  const _OrderTile({required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${order.id.substring(0, 8)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _statusColor(order.status).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    order.status.name.toUpperCase(),
                    style: TextStyle(
                      color: _statusColor(order.status),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 14,
                  color: Colors.white54,
                ),
                const SizedBox(width: 4),
                Text(
                  order.userId.substring(0, 8),
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                ),
                const Spacer(),
                const Icon(Icons.inventory_2, size: 14, color: Colors.white54),
                const SizedBox(width: 4),
                Text(
                  '${order.items.length} items',
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                ),
                const Spacer(),
                Text(
                  '\$${order.total.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<OrderStatus>(
                    initialValue: order.status,
                    isDense: true,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      isDense: true,
                    ),
                    items: OrderStatus.values
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(
                              s.name,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (newStatus) {
                      if (newStatus == null || newStatus == order.status) {
                        return;
                      }
                      FirebaseFirestore.instance
                          .collection(FirestorePaths.orders)
                          .doc(order.id)
                          .update({
                            'status': newStatus.name,
                            'updatedAt': FieldValue.serverTimestamp(),
                            'timeline': FieldValue.arrayUnion([
                              {
                                'status': newStatus.name,
                                'at': Timestamp.now(),
                                'note': 'Updated by admin',
                              },
                            ]),
                          });
                    },
                  ),
                ),
              ],
            ),
            if (order.deliveryAddress.city.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '${order.deliveryAddress.line1}, ${order.deliveryAddress.city}',
                  style: const TextStyle(fontSize: 11, color: Colors.white38),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CategoriesTab extends StatelessWidget {
  const _CategoriesTab();

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
      builder: (context, ref, _) {
        final async = ref.watch(categoriesStreamProvider);
        return async.when(
          data: (categories) => _CategoriesBody(categories: categories),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        );
      },
    );
  }
}

class _CategoriesBody extends StatelessWidget {
  const _CategoriesBody({required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: const Color(0xFF0D0D0D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${categories.length} Categories',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showForm(context, null),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber.shade800,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: categories.length,
            itemBuilder: (_, i) => _CategoryTile(
              category: categories[i],
              onEdit: () => _showForm(context, categories[i]),
              onToggle: () {
                FirebaseFirestore.instance
                    .collection(FirestorePaths.categories)
                    .doc(categories[i].id)
                    .update({'isActive': !categories[i].isActive});
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showForm(BuildContext context, CategoryModel? c) {
    final nameCtrl = TextEditingController(text: c?.name ?? '');
    final orderCtrl = TextEditingController(
      text: c != null ? '${c.sortOrder}' : '0',
    );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              c == null ? 'Add Category' : 'Edit Category',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Category Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: orderCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Sort Order'),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber.shade800,
                ),
                onPressed: () async {
                  if (nameCtrl.text.trim().isEmpty) return;
                  final db = FirebaseFirestore.instance;
                  final id =
                      c?.id ?? 'cat_${nameCtrl.text.trim().toLowerCase()}';
                  await db.collection(FirestorePaths.categories).doc(id).set({
                    'name': nameCtrl.text.trim(),
                    'slug': nameCtrl.text.trim().toLowerCase(),
                    'sortOrder': int.tryParse(orderCtrl.text) ?? 0,
                    'isActive': c?.isActive ?? true,
                    if (c == null) 'createdAt': FieldValue.serverTimestamp(),
                    'updatedAt': FieldValue.serverTimestamp(),
                  }, SetOptions(merge: true));
                  if (context.mounted) Navigator.pop(context);
                },
                child: Text(c == null ? 'Create' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.onEdit,
    required this.onToggle,
  });
  final CategoryModel category;
  final VoidCallback onEdit, onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: category.isActive
                ? Colors.amber.shade800.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.category,
            color: category.isActive ? Colors.amber.shade300 : Colors.grey,
          ),
        ),
        title: Text(
          category.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: category.isActive ? Colors.white : Colors.white38,
          ),
        ),
        subtitle: Text(
          'Order: ${category.sortOrder}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: category.isActive,
              onChanged: (_) => onToggle(),
              activeThumbColor: Colors.amber.shade400,
            ),
            InkWell(
              onTap: onEdit,
              borderRadius: BorderRadius.circular(6),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BannersTab extends StatelessWidget {
  const _BannersTab();

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
      builder: (context, ref, _) {
        final async = ref.watch(bannersStreamProvider);
        return async.when(
          data: (banners) => _BannersBody(banners: banners),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        );
      },
    );
  }
}

class _BannersBody extends StatelessWidget {
  const _BannersBody({required this.banners});
  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: const Color(0xFF0D0D0D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${banners.length} Banners',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showForm(context, null),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber.shade800,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: banners.length,
            itemBuilder: (_, i) => _BannerTile(
              banner: banners[i],
              onEdit: () => _showForm(context, banners[i]),
              onToggle: () {
                FirebaseFirestore.instance
                    .collection(FirestorePaths.banners)
                    .doc(banners[i].id)
                    .update({'isActive': !banners[i].isActive});
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showForm(BuildContext context, BannerModel? b) {
    final titleCtrl = TextEditingController(text: b?.title ?? '');
    final subtitleCtrl = TextEditingController(text: b?.subtitle ?? '');
    final imageCtrl = TextEditingController(text: b?.imageUrl ?? '');
    final orderCtrl = TextEditingController(
      text: b != null ? '${b.sortOrder}' : '0',
    );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                b == null ? 'Add Banner' : 'Edit Banner',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              if (imageCtrl.text.isNotEmpty)
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageCtrl.text),
                      fit: BoxFit.cover,
                      onError: (_, _) {},
                    ),
                  ),
                ),
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: subtitleCtrl,
                decoration: const InputDecoration(labelText: 'Subtitle'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: imageCtrl,
                decoration: const InputDecoration(labelText: 'Image URL'),
                onChanged: (_) {},
              ),
              const SizedBox(height: 10),
              TextField(
                controller: orderCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Sort Order'),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber.shade800,
                  ),
                  onPressed: () async {
                    if (titleCtrl.text.trim().isEmpty ||
                        imageCtrl.text.trim().isEmpty) {
                      return;
                    }
                    final db = FirebaseFirestore.instance;
                    final id =
                        b?.id ??
                        'banner_${DateTime.now().millisecondsSinceEpoch}';
                    await db.collection(FirestorePaths.banners).doc(id).set({
                      'title': titleCtrl.text.trim(),
                      'subtitle': subtitleCtrl.text.trim(),
                      'imageUrl': imageCtrl.text.trim(),
                      'linkType': 'none',
                      'linkValue': '',
                      'sortOrder': int.tryParse(orderCtrl.text) ?? 0,
                      'isActive': b?.isActive ?? true,
                    });
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: Text(b == null ? 'Create' : 'Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerTile extends StatelessWidget {
  const _BannerTile({
    required this.banner,
    required this.onEdit,
    required this.onToggle,
  });
  final BannerModel banner;
  final VoidCallback onEdit, onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            banner.imageUrl,
            width: 52,
            height: 52,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 52,
              height: 52,
              color: Colors.grey[850],
              child: const Icon(Icons.broken_image, color: Colors.white38),
            ),
          ),
        ),
        title: Text(
          banner.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: banner.isActive ? Colors.white : Colors.white38,
          ),
        ),
        subtitle: Text(
          'Order: ${banner.sortOrder}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: banner.isActive,
              onChanged: (_) => onToggle(),
              activeThumbColor: Colors.amber.shade400,
            ),
            InkWell(
              onTap: onEdit,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OffersTab extends StatelessWidget {
  const _OffersTab();

  @override
  Widget build(BuildContext context) {
    return riverpod.Consumer(
      builder: (context, ref, _) {
        final async = ref.watch(allOffersStreamProvider);
        return async.when(
          data: (offers) => _OffersBody(offers: offers),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        );
      },
    );
  }
}

class _OffersBody extends StatelessWidget {
  const _OffersBody({required this.offers});
  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: const Color(0xFF0D0D0D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${offers.length} Offers',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showForm(context, null),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.amber.shade800,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: offers.length,
            itemBuilder: (_, i) => _OfferTile(
              offer: offers[i],
              onToggle: () {
                FirebaseFirestore.instance
                    .collection(FirestorePaths.offers)
                    .doc(offers[i].id)
                    .update({'isActive': !offers[i].isActive});
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showForm(BuildContext context, OfferModel? o) {
    final titleCtrl = TextEditingController(text: o?.title ?? '');
    final codeCtrl = TextEditingController(text: o?.couponCode ?? '');
    final valueCtrl = TextEditingController(
      text: o != null ? '${o.value}' : '',
    );
    final minCtrl = TextEditingController(
      text: o != null ? '${o.minOrderAmount}' : '0',
    );
    String type = o?.type.name ?? 'percentage';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                o == null ? 'Add Offer' : 'Edit Offer',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: codeCtrl,
                decoration: const InputDecoration(
                  labelText: 'Coupon Code',
                  hintText: 'e.g. SUMMER20',
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: OfferType.values
                    .map(
                      (t) =>
                          DropdownMenuItem(value: t.name, child: Text(t.name)),
                    )
                    .toList(),
                onChanged: (v) =>
                    setDialogState(() => type = v ?? 'percentage'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: valueCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: type == 'percentage'
                      ? 'Percentage %'
                      : 'Amount \$',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: minCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Min Order Amount',
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber.shade800,
                  ),
                  onPressed: () async {
                    if (titleCtrl.text.trim().isEmpty) return;
                    final db = FirebaseFirestore.instance;
                    final id =
                        o?.id ??
                        'offer_${DateTime.now().millisecondsSinceEpoch}';
                    final offerType = OfferType.values.firstWhere(
                      (t) => t.name == type,
                    );
                    await db.collection(FirestorePaths.offers).doc(id).set({
                      'title': titleCtrl.text.trim(),
                      'type': offerType.name,
                      'value': double.tryParse(valueCtrl.text) ?? 0,
                      'couponCode': codeCtrl.text.trim(),
                      'minOrderAmount': double.tryParse(minCtrl.text) ?? 0,
                      'isActive': o?.isActive ?? true,
                    }, SetOptions(merge: true));
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: Text(o == null ? 'Create' : 'Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OfferTile extends StatelessWidget {
  const _OfferTile({required this.offer, required this.onToggle});
  final OfferModel offer;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.local_offer,
            color: offer.isActive ? Colors.green : Colors.grey,
            size: 20,
          ),
        ),
        title: Text(
          offer.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: offer.isActive ? Colors.white : Colors.white38,
          ),
        ),
        subtitle: Text(
          '${offer.couponCode.isNotEmpty ? "${offer.couponCode}  |  " : ""}${offer.value}${offer.type == OfferType.percentage ? "%" : "\$"} OFF',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Switch(
          value: offer.isActive,
          onChanged: (_) => onToggle(),
          activeThumbColor: Colors.amber.shade400,
        ),
      ),
    );
  }
}
