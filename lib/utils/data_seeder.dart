import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/transaction_service.dart';

/// Helper class to seed sample data for testing
class DataSeeder {
  final TransactionService _service = TransactionService();

  /// Seed sample transactions for testing
  Future<void> seedSampleData() async {
    // Check if data already exists
    final existingTransactions = await _service.getTransactions();
    if (existingTransactions.isNotEmpty) {
      print('Data already exists. Skipping seed.');
      return;
    }

    final now = DateTime.now();
    
    final sampleTransactions = [
      // Income transactions
      Transaction(
        id: '${now.millisecondsSinceEpoch}_1',
        title: 'Uang Saku Bulanan',
        amount: 1500000,
        type: TransactionType.income,
        category: TransactionCategory.allowance,
        date: now.subtract(const Duration(days: 25)),
        note: 'Uang saku dari orang tua',
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_2',
        title: 'Freelance Design',
        amount: 500000,
        type: TransactionType.income,
        category: TransactionCategory.salary,
        date: now.subtract(const Duration(days: 15)),
        note: 'Project logo design',
      ),
      
      // Expense transactions - Food
      Transaction(
        id: '${now.millisecondsSinceEpoch}_3',
        title: 'Makan Siang Warteg',
        amount: 15000,
        type: TransactionType.expense,
        category: TransactionCategory.food,
        date: now.subtract(const Duration(days: 1)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_4',
        title: 'Beli Snack',
        amount: 25000,
        type: TransactionType.expense,
        category: TransactionCategory.food,
        date: now.subtract(const Duration(days: 2)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_5',
        title: 'Makan Malam',
        amount: 30000,
        type: TransactionType.expense,
        category: TransactionCategory.food,
        date: now.subtract(const Duration(days: 3)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_6',
        title: 'Kopi & Roti',
        amount: 20000,
        type: TransactionType.expense,
        category: TransactionCategory.food,
        date: now.subtract(const Duration(days: 5)),
      ),
      
      // Transport
      Transaction(
        id: '${now.millisecondsSinceEpoch}_7',
        title: 'Ongkos Angkot',
        amount: 10000,
        type: TransactionType.expense,
        category: TransactionCategory.transport,
        date: now.subtract(const Duration(days: 1)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_8',
        title: 'Bensin Motor',
        amount: 50000,
        type: TransactionType.expense,
        category: TransactionCategory.transport,
        date: now.subtract(const Duration(days: 7)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_9',
        title: 'Ojek Online',
        amount: 25000,
        type: TransactionType.expense,
        category: TransactionCategory.transport,
        date: now.subtract(const Duration(days: 10)),
      ),
      
      // Education
      Transaction(
        id: '${now.millisecondsSinceEpoch}_10',
        title: 'Beli Buku Kuliah',
        amount: 150000,
        type: TransactionType.expense,
        category: TransactionCategory.education,
        date: now.subtract(const Duration(days: 20)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_11',
        title: 'Fotokopi Materi',
        amount: 15000,
        type: TransactionType.expense,
        category: TransactionCategory.education,
        date: now.subtract(const Duration(days: 12)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_12',
        title: 'Pulsa Internet',
        amount: 50000,
        type: TransactionType.expense,
        category: TransactionCategory.education,
        date: now.subtract(const Duration(days: 8)),
      ),
      
      // Entertainment
      Transaction(
        id: '${now.millisecondsSinceEpoch}_13',
        title: 'Nonton Bioskop',
        amount: 50000,
        type: TransactionType.expense,
        category: TransactionCategory.entertainment,
        date: now.subtract(const Duration(days: 14)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_14',
        title: 'Game Voucher',
        amount: 100000,
        type: TransactionType.expense,
        category: TransactionCategory.entertainment,
        date: now.subtract(const Duration(days: 18)),
      ),
      
      // Shopping
      Transaction(
        id: '${now.millisecondsSinceEpoch}_15',
        title: 'Beli Baju',
        amount: 200000,
        type: TransactionType.expense,
        category: TransactionCategory.shopping,
        date: now.subtract(const Duration(days: 22)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_16',
        title: 'Sepatu Baru',
        amount: 300000,
        type: TransactionType.expense,
        category: TransactionCategory.shopping,
        date: now.subtract(const Duration(days: 24)),
      ),
      
      // Bills
      Transaction(
        id: '${now.millisecondsSinceEpoch}_17',
        title: 'Bayar Kos',
        amount: 800000,
        type: TransactionType.expense,
        category: TransactionCategory.bills,
        date: now.subtract(const Duration(days: 26)),
      ),
      Transaction(
        id: '${now.millisecondsSinceEpoch}_18',
        title: 'Listrik & Air',
        amount: 100000,
        type: TransactionType.expense,
        category: TransactionCategory.bills,
        date: now.subtract(const Duration(days: 26)),
      ),
      
      // Health
      Transaction(
        id: '${now.millisecondsSinceEpoch}_19',
        title: 'Beli Obat',
        amount: 35000,
        type: TransactionType.expense,
        category: TransactionCategory.health,
        date: now.subtract(const Duration(days: 6)),
      ),
      
      // Other
      Transaction(
        id: '${now.millisecondsSinceEpoch}_20',
        title: 'Lain-lain',
        amount: 50000,
        type: TransactionType.expense,
        category: TransactionCategory.other,
        date: now.subtract(const Duration(days: 4)),
      ),
    ];

    // Save all transactions
    for (var transaction in sampleTransactions) {
      await _service.addTransaction(transaction);
    }

    print('✅ Sample data seeded successfully!');
    print('📊 Total transactions: ${sampleTransactions.length}');
    print('💰 Total income: Rp ${await _service.getTotalIncome()}');
    print('💸 Total expense: Rp ${await _service.getTotalExpense()}');
    print('💵 Balance: Rp ${await _service.getTotalBalance()}');
  }

  /// Clear all data
  Future<void> clearAllData() async {
    await _service.clearAllTransactions();
    print('🗑️ All data cleared!');
  }
}
