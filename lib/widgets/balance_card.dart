import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/currency_formatter.dart';

/// Balance card with gradient background
class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final double totalIncome;
  final double totalExpense;

  const BalanceCard({
    Key? key,
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppTheme.spacingMd),
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      decoration: BoxDecoration(
        gradient: AppColors.balanceCardGradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total Balance Label
          Text(
            'Total Saldo',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: AppTheme.spacingSm),
          
          // Total Balance Amount
          Text(
            CurrencyFormatter.formatToIDR(totalBalance),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          
          const SizedBox(height: AppTheme.spacingLg),
          
          // Income and Expense Row
          Row(
            children: [
              // Income
              Expanded(
                child: _BalanceItem(
                  icon: Icons.arrow_downward_rounded,
                  label: 'Pemasukan',
                  amount: CurrencyFormatter.formatToIDR(totalIncome),
                  iconColor: Colors.white,
                  iconBackground: Colors.white.withValues(alpha: 0.2),
                ),
              ),
              
              const SizedBox(width: AppTheme.spacingMd),
              
              // Expense
              Expanded(
                child: _BalanceItem(
                  icon: Icons.arrow_upward_rounded,
                  label: 'Pengeluaran',
                  amount: CurrencyFormatter.formatToIDR(totalExpense),
                  iconColor: Colors.white,
                  iconBackground: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Balance item widget (income/expense)
class _BalanceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;
  final Color iconColor;
  final Color iconBackground;

  const _BalanceItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.amount,
    required this.iconColor,
    required this.iconBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingSm),
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: AppTheme.iconMd,
            ),
          ),
          
          const SizedBox(width: AppTheme.spacingMd),
          
          // Label and Amount
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 11,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  amount,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
