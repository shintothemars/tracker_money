import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/transaction_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../utils/date_formatter.dart';

/// Add/Edit transaction page (bottom sheet style)
class AddTransactionPage extends StatefulWidget {
  final Transaction? transaction;

  const AddTransactionPage({
    Key? key,
    this.transaction,
  }) : super(key: key);

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  final TransactionService _service = TransactionService();
  
  TransactionType _selectedType = TransactionType.expense;
  TransactionCategory _selectedCategory = TransactionCategory.food;
  DateTime _selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      _titleController.text = widget.transaction!.title;
      _amountController.text = widget.transaction!.amount.toString();
      _noteController.text = widget.transaction!.note ?? '';
      _selectedType = widget.transaction!.type;
      _selectedCategory = widget.transaction!.category;
      _selectedDate = widget.transaction!.date;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _saveTransaction() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      
      // Create or update transaction
      final transaction = Transaction(
        id: widget.transaction?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        type: _selectedType,
        category: _selectedCategory,
        date: _selectedDate,
        note: _noteController.text.isEmpty ? null : _noteController.text,
      );
      
      // Save to SharedPreferences
      bool success;
      if (widget.transaction == null) {
        success = await _service.addTransaction(transaction);
      } else {
        success = await _service.updateTransaction(transaction);
      }
      
      setState(() => _isLoading = false);
      
      if (mounted && success) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.transaction == null
                  ? 'Transaksi berhasil ditambahkan'
                  : 'Transaksi berhasil diperbarui',
            ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppTheme.radiusLg),
          topRight: Radius.circular(AppTheme.radiusLg),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacingLg),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle Bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryDark,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingLg),
                    
                    // Title
                    Text(
                      widget.transaction == null
                          ? 'Tambah Transaksi'
                          : 'Edit Transaksi',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: AppTheme.spacingLg),
                    
                    // Transaction Type Selector
                    Row(
                      children: [
                        Expanded(
                          child: _TypeButton(
                            label: 'Pemasukan',
                            icon: Icons.arrow_downward_rounded,
                            isSelected: _selectedType == TransactionType.income,
                            color: AppColors.income,
                            onTap: () => setState(() => _selectedType = TransactionType.income),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spacingMd),
                        Expanded(
                          child: _TypeButton(
                            label: 'Pengeluaran',
                            icon: Icons.arrow_upward_rounded,
                            isSelected: _selectedType == TransactionType.expense,
                            color: AppColors.expense,
                            onTap: () => setState(() => _selectedType = TransactionType.expense),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: AppTheme.spacingLg),
                    
                    // Title Field
                    CustomTextField(
                      label: 'Judul',
                      hint: 'Masukkan judul transaksi',
                      prefixIcon: Icons.title_rounded,
                      controller: _titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: AppTheme.spacingMd),
                    
                    // Amount Field
                    CustomTextField(
                      label: 'Jumlah',
                      hint: 'Masukkan jumlah',
                      prefixIcon: Icons.attach_money_rounded,
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Jumlah tidak boleh kosong';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Jumlah tidak valid';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: AppTheme.spacingMd),
                    
                    // Category Label
                    Text(
                      'Kategori',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingSm),
                    
                    // Category Selector
                    Wrap(
                      spacing: AppTheme.spacingSm,
                      runSpacing: AppTheme.spacingSm,
                      children: TransactionCategory.values.map((category) {
                        final transaction = Transaction(
                          id: '',
                          title: '',
                          amount: 0,
                          type: _selectedType,
                          category: category,
                          date: DateTime.now(),
                        );
                        
                        return ChoiceChip(
                          label: Text('${transaction.categoryIcon} ${transaction.categoryName}'),
                          selected: _selectedCategory == category,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedCategory = category);
                            }
                          },
                          selectedColor: AppColors.primary.withOpacity(0.2),
                          backgroundColor: AppColors.secondary,
                          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: _selectedCategory == category
                                    ? AppColors.primary
                                    : AppColors.textSecondary,
                                fontWeight: _selectedCategory == category
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                          side: BorderSide(
                            color: _selectedCategory == category
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 1,
                          ),
                        );
                      }).toList(),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingMd),
                    
                    // Date Picker
                    CustomTextField(
                      label: 'Tanggal',
                      hint: 'Pilih tanggal',
                      prefixIcon: Icons.calendar_today_rounded,
                      controller: TextEditingController(
                        text: DateFormatter.formatToIndonesian(_selectedDate),
                      ),
                      readOnly: true,
                      onTap: _selectDate,
                    ),
                    
                    const SizedBox(height: AppTheme.spacingMd),
                    
                    // Note Field
                    CustomTextField(
                      label: 'Catatan (Opsional)',
                      hint: 'Tambahkan catatan',
                      prefixIcon: Icons.note_rounded,
                      controller: _noteController,
                      maxLines: 3,
                    ),
                    
                    const SizedBox(height: AppTheme.spacingXl),
                    
                    // Save Button
                    CustomButton(
                      text: 'Simpan Transaksi',
                      onPressed: _saveTransaction,
                      isLoading: _isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Transaction type button
class _TypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _TypeButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingMd,
        ),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : AppColors.secondary,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? color : AppColors.textSecondary,
              size: AppTheme.iconMd,
            ),
            const SizedBox(width: AppTheme.spacingSm),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected ? color : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
