import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import 'login_page.dart';

/// Profile page with settings
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _profileEmoji = '👤'; // Default emoji avatar

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        ),
        title: const Text('Keluar'),
        content: const Text('Apakah kamu yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: Text(
              'Keluar',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfilePictureDialog() {
    final List<String> avatarEmojis = [
      '👤', '😊', '😎', '🤓', '😇', '🥳', '🤩', '😴',
      '🤑', '🤠', '👨‍💼', '👩‍💼', '👨‍🎓', '👩‍🎓', '🧑‍💻', '👨‍🍳',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        title: const Text('Pilih Avatar'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: avatarEmojis.length,
            itemBuilder: (context, index) {
              final emoji = avatarEmojis[index];
              final isSelected = emoji == _profileEmoji;
              
              return InkWell(
                onTap: () {
                  setState(() => _profileEmoji = emoji);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Foto profil berhasil diubah'),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      ),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppColors.primary.withOpacity(0.1)
                        : AppColors.secondary,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    border: Border.all(
                      color: isSelected 
                          ? AppColors.primary 
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppTheme.spacingLg),
              
              // Header
              Padding(
                padding: const EdgeInsets.all(AppTheme.spacingMd),
                child: Text(
                  'Profil',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              
              const SizedBox(height: AppTheme.spacingMd),
              
              // Profile Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                padding: const EdgeInsets.all(AppTheme.spacingLg),
                decoration: BoxDecoration(
                  gradient: AppColors.balanceCardGradient,
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                  boxShadow: AppTheme.softShadow,
                ),
                child: Row(
                  children: [
                    // Avatar - Clickable
                    GestureDetector(
                      onTap: _showEditProfilePictureDialog,
                      child: Stack(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _profileEmoji,
                                style: const TextStyle(fontSize: 36),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: AppTheme.spacingMd),
                    
                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Anak Kos',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'anakkos@email.com',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Edit Button
                    IconButton(
                      onPressed: _showEditProfilePictureDialog,
                      icon: const Icon(
                        Icons.edit_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: AppTheme.spacingLg),
              
              // Settings List
              _SettingsSection(
                title: 'Umum',
                items: [
                  _SettingsItem(
                    icon: Icons.person_outline_rounded,
                    title: 'Edit Profil',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifikasi',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.lock_outline_rounded,
                    title: 'Ubah Password',
                    onTap: () {},
                  ),
                ],
              ),
              
              const SizedBox(height: AppTheme.spacingMd),
              
              _SettingsSection(
                title: 'Lainnya',
                items: [
                  _SettingsItem(
                    icon: Icons.help_outline_rounded,
                    title: 'Bantuan',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Kebijakan Privasi',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.info_outline_rounded,
                    title: 'Tentang Aplikasi',
                    subtitle: 'Versi 1.0.0',
                    onTap: () {},
                  ),
                ],
              ),
              
              const SizedBox(height: AppTheme.spacingXl),
              
              // Logout Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                child: CustomButton(
                  text: 'Keluar',
                  onPressed: () => _handleLogout(context),
                  icon: Icons.logout_rounded,
                  gradient: null,
                  backgroundColor: AppColors.error,
                ),
              ),
              
              const SizedBox(height: AppTheme.spacingXl),
            ],
          ),
        ),
      ),
    );
  }
}

/// Settings section widget
class _SettingsSection extends StatelessWidget {
  final String title;
  final List<_SettingsItem> items;

  const _SettingsSection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingSm,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
          child: Column(
            children: items.map((item) {
              final isLast = items.last == item;
              return Column(
                children: [
                  item,
                  if (!isLast)
                    Divider(
                      height: 1,
                      indent: AppTheme.spacingMd + AppTheme.iconMd + AppTheme.spacingMd,
                      endIndent: AppTheme.spacingMd,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

/// Settings item widget
class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
        size: AppTheme.iconMd,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall,
            )
          : null,
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textLight,
      ),
      onTap: onTap,
    );
  }
}
