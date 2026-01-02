import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/transaction_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_card.dart';
import '../widgets/empty_state.dart';

/// Home page with balance card and transaction list
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TransactionService _service = TransactionService();
  
  List<Transaction> transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    setState(() => _isLoading = true);
    
    final loadedTransactions = await _service.getTransactions();
    
    setState(() {
      transactions = loadedTransactions;
      _isLoading = false;
    });
  }

  double get totalBalance {
    double income = transactions
        .where((t) => t.type == TransactionType.income)
        .fold<double>(0, (sum, t) => sum + t.amount);
    double expense = transactions
        .where((t) => t.type == TransactionType.expense)
        .fold<double>(0, (sum, t) => sum + t.amount);
    return income - expense;
  }

  double get totalIncome {
    return transactions
        .where((t) => t.type == TransactionType.income)
        .fold<double>(0, (sum, t) => sum + t.amount);
  }

  double get totalExpense {
    return transactions
        .where((t) => t.type == TransactionType.expense)
        .fold<double>(0, (sum, t) => sum + t.amount);
  }

  Future<void> _deleteTransaction(String id) async {
    final success = await _service.deleteTransaction(id);
    
    if (success) {
      await _loadTransactions();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Transaksi berhasil dihapus'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            ),
            backgroundColor: AppColors.success,
          ),
        );
      }
    }
  }

  Future<void> _refreshData() async {
    await _loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
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
                      
                      // Greeting
                      Text(
                        'Halo, Anak Kos 👋',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      
                      const SizedBox(height: AppTheme.spacingSm),
                      
                      Text(
                        'Kelola keuangan kamu dengan mudah',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Balance Card
              SliverToBoxAdapter(
                child: BalanceCard(
                  totalBalance: totalBalance,
                  totalIncome: totalIncome,
                  totalExpense: totalExpense,
                ),
              ),
              
              // Recent Transactions Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppTheme.spacingMd,
                    AppTheme.spacingLg,
                    AppTheme.spacingMd,
                    AppTheme.spacingSm,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaksi Terbaru',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all transactions
                        },
                        child: Text(
                          'Lihat Semua',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Transaction List
              transactions.isEmpty
                  ? SliverFillRemaining(
                      child: EmptyState(
                        emoji: '💸',
                        title: 'Belum Ada Transaksi',
                        message: 'Mulai catat transaksi keuangan kamu',
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final transaction = transactions[index];
                          return TransactionCard(
                            transaction: transaction,
                            onDelete: () => _deleteTransaction(transaction.id),
                          );
                        },
                        childCount: transactions.length > 5 ? 5 : transactions.length,
                      ),
                    ),
              
              // Bottom Spacing
              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spacingXl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
