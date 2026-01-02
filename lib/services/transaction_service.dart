import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction_model.dart';

/// Service for managing transactions with SharedPreferences
class TransactionService {
  static const String _transactionsKey = 'transactions';
  
  /// Get all transactions from SharedPreferences
  Future<List<Transaction>> getTransactions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? transactionsJson = prefs.getString(_transactionsKey);
      
      if (transactionsJson == null || transactionsJson.isEmpty) {
        return [];
      }
      
      final List<dynamic> decoded = json.decode(transactionsJson);
      return decoded.map((item) => Transaction.fromJson(item)).toList();
    } catch (e) {
      print('Error loading transactions: $e');
      return [];
    }
  }
  
  /// Save all transactions to SharedPreferences
  Future<bool> saveTransactions(List<Transaction> transactions) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encoded = json.encode(
        transactions.map((t) => t.toJson()).toList(),
      );
      return await prefs.setString(_transactionsKey, encoded);
    } catch (e) {
      print('Error saving transactions: $e');
      return false;
    }
  }
  
  /// Add a new transaction
  Future<bool> addTransaction(Transaction transaction) async {
    try {
      final transactions = await getTransactions();
      transactions.add(transaction);
      return await saveTransactions(transactions);
    } catch (e) {
      print('Error adding transaction: $e');
      return false;
    }
  }
  
  /// Update an existing transaction
  Future<bool> updateTransaction(Transaction transaction) async {
    try {
      final transactions = await getTransactions();
      final index = transactions.indexWhere((t) => t.id == transaction.id);
      
      if (index == -1) {
        return false;
      }
      
      transactions[index] = transaction;
      return await saveTransactions(transactions);
    } catch (e) {
      print('Error updating transaction: $e');
      return false;
    }
  }
  
  /// Delete a transaction by ID
  Future<bool> deleteTransaction(String id) async {
    try {
      final transactions = await getTransactions();
      transactions.removeWhere((t) => t.id == id);
      return await saveTransactions(transactions);
    } catch (e) {
      print('Error deleting transaction: $e');
      return false;
    }
  }
  
  /// Clear all transactions
  Future<bool> clearAllTransactions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_transactionsKey);
    } catch (e) {
      print('Error clearing transactions: $e');
      return false;
    }
  }
  
  /// Get total income
  Future<double> getTotalIncome() async {
    final transactions = await getTransactions();
    return transactions
        .where((t) => t.type == TransactionType.income)
        .fold<double>(0, (sum, t) => sum + t.amount);
  }
  
  /// Get total expense
  Future<double> getTotalExpense() async {
    final transactions = await getTransactions();
    return transactions
        .where((t) => t.type == TransactionType.expense)
        .fold<double>(0, (sum, t) => sum + t.amount);
  }
  
  /// Get total balance
  Future<double> getTotalBalance() async {
    final income = await getTotalIncome();
    final expense = await getTotalExpense();
    return income - expense;
  }
  
  /// Get expense breakdown by category
  Future<Map<TransactionCategory, double>> getExpenseByCategory() async {
    final transactions = await getTransactions();
    final expenses = transactions.where((t) => t.type == TransactionType.expense);
    
    final Map<TransactionCategory, double> breakdown = {};
    
    for (var transaction in expenses) {
      breakdown[transaction.category] = 
          (breakdown[transaction.category] ?? 0) + transaction.amount;
    }
    
    return breakdown;
  }
  
  /// Get income breakdown by category
  Future<Map<TransactionCategory, double>> getIncomeByCategory() async {
    final transactions = await getTransactions();
    final incomes = transactions.where((t) => t.type == TransactionType.income);
    
    final Map<TransactionCategory, double> breakdown = {};
    
    for (var transaction in incomes) {
      breakdown[transaction.category] = 
          (breakdown[transaction.category] ?? 0) + transaction.amount;
    }
    
    return breakdown;
  }
}
