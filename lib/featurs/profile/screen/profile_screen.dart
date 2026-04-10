import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/common/custom_button.dart';
import '../../../common/custom_color.dart';
import '../widget/custom_profilefield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Sadia Rabbito';
  String email = 'SadiaRabbito@gmail.com';
  String selectedLanguage = 'English (United States)';

  final List<String> languages = [
    'English (United States)',
    'বাংলা (Bangladesh)',
  ];

  void _showEditDialog({required String field, required String currentValue}) {
    final controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          field == 'name' ? 'Edit Name' : 'Edit Email Address',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field == 'name' ? 'New name' : 'New email',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType: field == 'email'
                  ? TextInputType.emailAddress
                  : TextInputType.name,
              decoration: InputDecoration(
                hintText: field == 'name' ? 'Enter your name' : 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff856DAD)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                setState(() {
                  if (field == 'name') {
                    name = value;
                  } else {
                    email = value;
                  }
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff856DAD),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                height: 293,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff856DAD),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color(0xff856DAD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    CustomProfilefield(
                      icon: Icons.person_outline,
                      label: 'Name',
                      value: name,
                      onEdit: () => _showEditDialog(field: 'name', currentValue: name),
                    ),
                    const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFEEEEEE)),
                    CustomProfilefield(
                      icon: Icons.email_outlined,
                      label: 'Email Address',
                      value: email,
                      onEdit: () => _showEditDialog(field: 'email', currentValue: email),
                    ),
                    const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFEEEEEE)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          const Icon(Icons.language, color: Color(0xff856DAD), size: 22),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Language',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedLanguage,
                                    isExpanded: true,
                                    isDense: true,
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                    items: languages
                                        .map((lang) => DropdownMenuItem(
                                      value: lang,
                                      child: Text(lang),
                                    ))
                                        .toList(),
                                    onChanged: (val) {
                                      if (val != null) setState(() => selectedLanguage = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
             CustomButton(text: "Delete Account",
               onTap: () {
               showDialog(
                 context: context,
                 builder: (context) => AlertDialog(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16),
                   ),
                   title: const Text(
                     "Delete Account",
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Color(0xff856DAD),
                     ),
                   ),
                   content: const Text(
                     "Are you sure you want to delete your account? This action cannot be undone.",
                     style: TextStyle(fontSize: 14, color: Colors.grey),
                   ),
                   actions: [
                     TextButton(
                       onPressed: () => Navigator.pop(context),
                       child: const Text(
                         "Cancel",
                         style: TextStyle(color: Color(0xff856DAD),),
                       ),
                     ),
                     ElevatedButton(
                       onPressed: () {
                         Navigator.pop(context);
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xff856DAD),
                         foregroundColor: Colors.white,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                         textStyle: const TextStyle(fontSize: 13),
                       ),
                       child: const Text("Delete Account"),
                     ),
                   ],
                 ),
               );
             },
             ),

              const SizedBox(height: 20),
              CustomButton(text: "Sign Out", onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    title: const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff856DAD),
                      ),
                    ),
                    content: const Text(
                      "Are you sure you want to sign out?",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Color(0xff856DAD),),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text("Sign Out"),
                      ),
                    ],
                  ),
                );
              },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
