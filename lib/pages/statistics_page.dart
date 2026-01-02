import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transaction_model.dart';
import '../services/transaction_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/currency_formatter.dart';

/// Statistics page with animated pie charts
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with SingleTickerProviderStateMixin {
  final TransactionService _service = TransactionService();
  
  Map<TransactionCategory, double> _expenseData = {};
  Map<TransactionCategory, double> _incomeData = {};
  double _totalIncome = 0;
  double _totalExpense = 0;
  bool _isLoading = true;
  int _touchedIndex = -1;
  
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _loadData();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );
    
    _animationController.forward();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    
    final expenseData = await _service.getExpenseByCategory();
    final incomeData = await _service.getIncomeByCategory();
    final totalIncome = await _service.getTotalIncome();
    final totalExpense = await _service.getTotalExpense();
    
    setState(() {
      _expenseData = expenseData;
      _incomeData = incomeData;
      _totalIncome = totalIncome;
      _totalExpense = totalExpense;
      _isLoading = false;
    });
    
    // Restart animation when data loads
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadData,
          color: AppColors.primary,
          child: CustomScrollView(
            slivers: [
              // App Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppTheme.spacingSm),
                      Text(
                        'Statistik 📊',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: AppTheme.spacingSm),
                      Text(
                        'Visualisasi keuangan kamu',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),

              // Summary Cards
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingMd,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildSummaryCard(
                          'Pemasukan',
                          _totalIncome,
                          AppColors.success,
                          Icons.arrow_upward_rounded,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingSm),
                      Expanded(
                        child: _buildSummaryCard(
                          'Pengeluaran',
                          _totalExpense,
                          AppColors.error,
                          Icons.arrow_downward_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spacingLg),
              ),

              // Expense Chart
              if (_expenseData.isNotEmpty)
                SliverToBoxAdapter(
                  child: _buildChartSection(
                    'Pengeluaran per Kategori',
                    _expenseData,
                    _totalExpense,
                    true,
                  ),
                ),

              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spacingLg),
              ),

              // Income Chart
              if (_incomeData.isNotEmpty)
                SliverToBoxAdapter(
                  child: _buildChartSection(
                    'Pemasukan per Kategori',
                    _incomeData,
                    _totalIncome,
                    false,
                  ),
                ),

              // Empty State
              if (_expenseData.isEmpty && _incomeData.isEmpty && !_isLoading)
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '📊',
                          style: const TextStyle(fontSize: 64),
                        ),
                        const SizedBox(height: AppTheme.spacingMd),
                        Text(
                          'Belum Ada Data',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: AppTheme.spacingSm),
                        Text(
                          'Mulai catat transaksi untuk melihat statistik',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),

              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spacingXl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              CurrencyFormatter.formatToIDR(amount),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection(
    String title,
    Map<TransactionCategory, double> data,
    double total,
    bool isExpense,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppTheme.spacingLg),
            
            // Pie Chart
            SizedBox(
              height: 280,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              _touchedIndex = -1;
                              return;
                            }
                            _touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 60,
                      sections: _buildPieChartSections(data, total, isExpense),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: AppTheme.spacingLg),
            
            // Legend
            _buildLegend(data, total),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
    Map<TransactionCategory, double> data,
    double total,
    bool isExpense,
  ) {
    final colors = isExpense ? _expenseColors : _incomeColors;
    final entries = data.entries.toList();
    
    return List.generate(entries.length, (index) {
      final entry = entries[index];
      final isTouched = index == _touchedIndex;
      final double radius = isTouched ? 70 : 60;
      final double fontSize = isTouched ? 16 : 14;
      final percentage = (entry.value / total * 100);
      
      return PieChartSectionData(
        color: colors[index % colors.length],
        value: entry.value * _animation.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            const Shadow(
              color: Colors.black26,
              blurRadius: 2,
            ),
          ],
        ),
        badgeWidget: isTouched
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  _getCategoryIcon(entry.key),
                  style: const TextStyle(fontSize: 24),
                ),
              )
            : null,
        badgePositionPercentageOffset: 1.3,
      );
    });
  }

  Widget _buildLegend(Map<TransactionCategory, double> data, double total) {
    final colors = data.entries.first.key == TransactionCategory.food ||
            data.entries.first.key == TransactionCategory.transport
        ? _expenseColors
        : _incomeColors;
    final entries = data.entries.toList();
    
    return Column(
      children: List.generate(entries.length, (index) {
        final entry = entries[index];
        final percentage = (entry.value / total * 100);
        
        return Padding(
          padding: const EdgeInsets.only(bottom: AppTheme.spacingSm),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: AppTheme.spacingSm),
              Text(
                _getCategoryIcon(entry.key),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: AppTheme.spacingXs),
              Expanded(
                child: Text(
                  _getCategoryName(entry.key),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(width: AppTheme.spacingSm),
              Text(
                CurrencyFormatter.formatToIDR(entry.value),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String _getCategoryName(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return 'Makanan';
      case TransactionCategory.transport:
        return 'Transportasi';
      case TransactionCategory.education:
        return 'Pendidikan';
      case TransactionCategory.entertainment:
        return 'Hiburan';
      case TransactionCategory.health:
        return 'Kesehatan';
      case TransactionCategory.shopping:
        return 'Belanja';
      case TransactionCategory.bills:
        return 'Tagihan';
      case TransactionCategory.salary:
        return 'Gaji';
      case TransactionCategory.allowance:
        return 'Uang Saku';
      case TransactionCategory.other:
        return 'Lainnya';
    }
  }

  String _getCategoryIcon(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return '🍔';
      case TransactionCategory.transport:
        return '🚗';
      case TransactionCategory.education:
        return '📚';
      case TransactionCategory.entertainment:
        return '🎮';
      case TransactionCategory.health:
        return '💊';
      case TransactionCategory.shopping:
        return '🛍️';
      case TransactionCategory.bills:
        return '📄';
      case TransactionCategory.salary:
        return '💰';
      case TransactionCategory.allowance:
        return '💵';
      case TransactionCategory.other:
        return '📌';
    }
  }

  final List<Color> _expenseColors = [
    const Color(0xFFFF6B6B), // Red
    const Color(0xFFFFB84D), // Orange
    const Color(0xFFFFD93D), // Yellow
    const Color(0xFF6BCF7F), // Green
    const Color(0xFF4ECDC4), // Teal
    const Color(0xFF45B7D1), // Blue
    const Color(0xFF9B59B6), // Purple
    const Color(0xFFE91E63), // Pink
    const Color(0xFF795548), // Brown
    const Color(0xFF607D8B), // Blue Grey
  ];

  final List<Color> _incomeColors = [
    const Color(0xFF00D9A5), // Emerald
    const Color(0xFF4CAF50), // Green
    const Color(0xFF8BC34A), // Light Green
    const Color(0xFF00BCD4), // Cyan
    const Color(0xFF03A9F4), // Light Blue
    const Color(0xFF2196F3), // Blue
    const Color(0xFF3F51B5), // Indigo
    const Color(0xFF009688), // Teal
  ];
}
