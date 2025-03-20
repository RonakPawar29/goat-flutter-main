import 'package:flutter/material.dart';
import 'package:login_page/src/view/screens/dashboard_screen.dart';
// Remove the duplicate import and keep only one ApiService

class FormBuilderScreen extends StatefulWidget {
  final String gymId;

  const FormBuilderScreen({Key? key, required this.gymId}) : super(key: key);

  @override
  _FormBuilderScreenState createState() => _FormBuilderScreenState();
}

class _FormBuilderScreenState extends State<FormBuilderScreen> {
  bool isLoading = true;
  Map<String, dynamic>? formConfig;
  Map<String, dynamic> formData = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }


  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      setState(() {
        isLoading = true;
      });
      
      try {
        // Add gymId to form data
        final submissionData = {
          'gymId': widget.gymId,
          ...formData,
        };
        
        print('Submitting form data: $submissionData');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Form submitted successfully',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        
        // Navigate to dashboard
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const GymDashboardScreen(),
          ),
        );
      } catch (e) {
        print('Error submitting form: ${e.toString()}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to submit form: ${e.toString().replaceAll('Exception: ', '')}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // Rest of the code remains the same
  Widget _buildFormField(Map<String, dynamic> field) {
    // Safely get values with null checking
   final String fieldId = field['fieldName'] ?? '';  // Changed from 'id' to 'fieldName'
  final String fieldType = field['type'] ?? 'text';
  final String fieldLabel = field['label'] ?? 'Field';
  final bool isRequired = field['required'] ?? false;
  final String? placeholder = field['placeholder'];
    
    // Handle empty or null fieldId
    if (fieldId.isEmpty) {
      return Container(); // Skip this field if ID is empty
    }
    
    switch (fieldType) {
      case 'text':
      case 'email':
      case 'phone':
        return TextFormField(
          decoration: InputDecoration(
            labelText: fieldLabel,
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: fieldType == 'email' 
              ? TextInputType.emailAddress 
              : fieldType == 'phone'
                  ? TextInputType.phone
                  : TextInputType.text,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return '$fieldLabel is required';
            }
            return null;
          },
          onSaved: (value) {
            formData[fieldId] = value;
          },
          initialValue: formData[fieldId]?.toString() ?? '',
        );
        
      case 'number':
        return TextFormField(
          decoration: InputDecoration(
            labelText: fieldLabel,
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return '$fieldLabel is required';
            }
            return null;
          },
          onSaved: (value) {
            formData[fieldId] = value != null && value.isNotEmpty ? int.tryParse(value) : null;
          },
          initialValue: formData[fieldId]?.toString() ?? '',
        );
        
      case 'select':
        final List<dynamic> options = field['options'] ?? [];
        if (options.isEmpty) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No options available for $fieldLabel'),
          );
        }
        
        // Ensure value is String or null
        String? currentValue = formData[fieldId]?.toString();
        
        // Check if currentValue exists in options
        bool valueExists = options.any((option) => option['value']?.toString() == currentValue);
        if (!valueExists) {
          currentValue = null;
        }
        
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: fieldLabel,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          items: options.map<DropdownMenuItem<String>>((option) {
            final String value = option['value']?.toString() ?? '';
            final String label = option['label']?.toString() ?? value;
            
            return DropdownMenuItem<String>(
              value: value,
              child: Text(label),
            );
          }).toList(),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'Please select a $fieldLabel';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              formData[fieldId] = value;
            });
          },
          onSaved: (value) {
            formData[fieldId] = value;
          },
          value: currentValue,
          hint: Text('Select $fieldLabel'),
        );
        
      case 'checkbox':
        bool? initialValue;
        
        if (formData.containsKey(fieldId)) {
          var val = formData[fieldId];
          if (val is bool) {
            initialValue = val;
          } else if (val is String) {
            initialValue = val.toLowerCase() == 'true';
          } else {
            initialValue = false;
          }
        } else {
          initialValue = false;
        }
        
        return FormField<bool>(
          initialValue: initialValue,
          validator: (value) {
            if (isRequired && (value == null || !value)) {
              return '$fieldLabel is required';
            }
            return null;
          },
          builder: (FormFieldState<bool> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: state.value ?? false,
                      onChanged: (bool? value) {
                        state.didChange(value);
                        setState(() {
                          formData[fieldId] = value ?? false;
                        });
                      },
                    ),
                    Expanded(child: Text(fieldLabel)),
                  ],
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      state.errorText!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
          onSaved: (value) {
            formData[fieldId] = value ?? false;
          },
        );
        
      case 'textarea':
        return TextFormField(
          decoration: InputDecoration(
            labelText: fieldLabel,
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 3,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return '$fieldLabel is required';
            }
            return null;
          },
          onSaved: (value) {
            formData[fieldId] = value;
          },
          initialValue: formData[fieldId]?.toString() ?? '',
        );
        
      default:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('Unsupported field type: $fieldType'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Your Profile'),
        backgroundColor: Color(0xFFFF6700),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : formConfig == null || formConfig!['fields'] == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Failed to load form configuration'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6700),
                        ),
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                         if (formConfig!['formTitle'] != null)  // Changed from 'title' to 'formTitle'
                          Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            formConfig!['formTitle'].toString(),  // Changed from 'title' to 'formTitle'
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            
                          if (formConfig!['description'] != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: Text(
                                formConfig!['description'].toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          
                          // Use a try-catch block to catch any errors during field building
                          Builder(
                            builder: (context) {
                              try {
                                List<dynamic> fields = formConfig!['fields'] ?? [];
                                return Column(
                                  children: List.generate(
                                    fields.length,
                                    (index) {
                                      try {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 16.0),
                                          child: _buildFormField(fields[index]),
                                        );
                                      } catch (e) {
                                        print('Error building field at index $index: $e');
                                        return Container(
                                          padding: EdgeInsets.all(8),
                                          color: Colors.amber[100],
                                          child: Text('Error in field ${index + 1}: ${e.toString()}'),
                                        );
                                      }
                                    },
                                  ),
                                );
                              } catch (e) {
                                return Container(
                                  padding: EdgeInsets.all(16),
                                  color: Colors.red[100],
                                  child: Text('Error building form: ${e.toString()}'),
                                );
                              }
                            },
                          ),
                            
                          SizedBox(height: 24),
                          
                          ElevatedButton(
                            onPressed: isLoading ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF6700),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: isLoading
                                ? SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}


