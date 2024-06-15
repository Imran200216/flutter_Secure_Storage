import 'package:flutter/material.dart';
import 'package:fss/provider/fss_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FssProvider>(
      builder: (context, fssProvider, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: fssProvider.dataController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data',
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),

                    /// create btn or store data btn
                    InkWell(
                      onTap: () {
                        fssProvider.writeDataSecure(
                            "data", fssProvider.dataController.text.trim());

                        /// this is secure storage service without provider
                        // SecureStorage()
                        //     .writeDataSecure("data", dataController.text
                        //     .trim());
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Text(
                            "Store Data",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    /// read btn
                    InkWell(
                      onTap: () {
                        fssProvider.readDataSecure("data");

                        /// this is secure storage service without provider
                        // SecureStorage().readDataSecure("data");
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Text(
                            "Read Data",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    /// delete btn
                    InkWell(
                      onTap: () {
                        fssProvider.deleteDataSecure("data");

                        /// this is a secure storage without provider
                        // SecureStorage().deleteDataSecure("data");
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Text(
                            "Delete Data",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
