/// Transaction type enum
enum TransactionType {
  income,
  expense,
}

/// Transaction category enum
enum TransactionCategory {
  food,
  transport,
  education,
  entertainment,
  health,
  shopping,
  bills,
  salary,
  allowance,
  other,
}

/// Transaction model
class Transaction {
  final String id;
  final String title;
  final double amount;
  final TransactionType type;
  final TransactionCategory category;
  final DateTime date;
  final String? note;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    this.note,
  });

  // Get category display name
  String get categoryName {
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

  // Get category icon
  String get categoryIcon {
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

  // Copy with method
  Transaction copyWith({
    String? id,
    String? title,
    double? amount,
    TransactionType? type,
    TransactionCategory? category,
    DateTime? date,
    String? note,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'type': type.toString(),
      'category': category.toString(),
      'date': date.toIso8601String(),
      'note': note,
    };
  }

  // From JSON
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      type: TransactionType.values.firstWhere(
        (e) => e.toString() == json['type'],
      ),
      category: TransactionCategory.values.firstWhere(
        (e) => e.toString() == json['category'],
      ),
      date: DateTime.parse(json['date']),
      note: json['note'],
    );
  }
}
