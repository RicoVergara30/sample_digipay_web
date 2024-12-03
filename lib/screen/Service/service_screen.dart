import 'package:flutter/material.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final _formKey = GlobalKey<FormState>();
  int currentStep = 0; // Tracks the current step

  // Text controllers for form inputs
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceDescriptionController =
      TextEditingController();
  final TextEditingController _servicePriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Service'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        children: [
          // Stepper section
          _buildStepper(),
          // Main form section
          Expanded(
            flex: 3,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Display content based on the current step
                    _buildStepContent(),
                    const SizedBox(height: 20),
                    // Navigation buttons
                    _buildNavigationButtons(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Builds the stepper on the left
  Widget _buildStepper() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() => currentStep = index),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: index == currentStep
                        ? Colors.white
                        : Colors.red.shade300,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: index == currentStep
                            ? Colors.redAccent
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (index < 3)
                  const SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builds the content for the current step
  Widget _buildStepContent() {
    switch (currentStep) {
      case 0:
        return _buildTextFormField(
          controller: _serviceNameController,
          label: 'Service Name',
          icon: Icons.title,
          hint: 'Enter the service name',
          validator: (value) =>
              value!.isEmpty ? 'Service name is required' : null,
        );
      case 1:
        return _buildTextFormField(
          controller: _serviceDescriptionController,
          label: 'Service Description',
          icon: Icons.description,
          hint: 'Enter a description',
          maxLines: 3,
          validator: (value) =>
              value!.isEmpty ? 'Description is required' : null,
        );
      case 2:
        return _buildTextFormField(
          controller: _servicePriceController,
          label: 'Service Price',
          icon: Icons.attach_money,
          hint: 'Enter the price',
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) return 'Price is required';
            if (double.tryParse(value) == null) return 'Enter a valid number';
            return null;
          },
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReviewItem('Service Name', _serviceNameController.text),
            _buildReviewItem('Description', _serviceDescriptionController.text),
            _buildReviewItem('Price', _servicePriceController.text),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _formKey.currentState?.validate() == true
                  ? _submitForm
                  : null,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text('Submit Service'),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // Navigation buttons
  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentStep > 0)
          OutlinedButton(
            onPressed: () => setState(() => currentStep -= 1),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.redAccent),
            child: const Text('Back'),
          ),
        ElevatedButton(
          onPressed: () {
            if (currentStep < 3) {
              setState(() => currentStep += 1);
            } else if (_formKey.currentState?.validate() == true) {
              _submitForm();
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: Text(currentStep == 3 ? 'Finish' : 'Next'),
        ),
      ],
    );
  }

  // Reusable text input field
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  // Review item for step 3
  Widget _buildReviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(value.isEmpty ? 'Not provided' : value,
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Handles form submission
  void _submitForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Service Added'),
        content: Text(
          'Service Name: ${_serviceNameController.text}\n'
          'Description: ${_serviceDescriptionController.text}\n'
          'Price: ${_servicePriceController.text}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => currentStep = 0); // Reset the stepper
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );

    // Clear the text fields
    _serviceNameController.clear();
    _serviceDescriptionController.clear();
    _servicePriceController.clear();
  }
}
