import 'package:flutter/material.dart';

class AddCategoryForm extends StatefulWidget {
  final void Function(
          String name, String description, String status, String imagePath)?
      onSubmit;
  const AddCategoryForm({super.key, this.onSubmit});

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _status = 'Actif';
  String? _imagePath;
  bool _submitted = false;

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: const Color(0xFFF3F3F3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFD6D6D6), width: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333)),
        ),
      );

  Widget warningBox() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3CD),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFEEBA)),
        ),
        child: const Row(
          children: [
            Icon(Icons.warning_amber_rounded,
                color: Color(0xFF856404), size: 26),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "Veuillez vérifier les informations avant de soumettre.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF856404)),
              ),
            ),
          ],
        ),
      );

  String? validateImage() {
    if (!_submitted) return null;
    if (_imagePath == null || _imagePath!.isEmpty) {
      return "L'image est obligatoire";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final imageError = validateImage();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label("Nom de la catégorie"),
          TextFormField(
            decoration: inputStyle("Ex : Informatique"),
            validator: (value) =>
                value!.isEmpty ? "Le nom est obligatoire" : null,
            onSaved: (value) => _name = value!,
          ),
          const SizedBox(height: 20),
          label("Description"),
          TextFormField(
            decoration: inputStyle("Une courte description..."),
            maxLines: 3,
            maxLength: 100,
            validator: (value) =>
                value!.isEmpty ? "La description est obligatoire" : null,
            onSaved: (value) => _description = value!,
          ),
          const SizedBox(height: 20),
          label("Statut"),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xFFF3F3F3),
            ),
            child: DropdownButtonFormField<String>(
              value: _status,
              decoration: inputStyle("Sélectionnez un statut"),
              dropdownColor: const Color(0xFFF3F3F3),
              items: const [
                DropdownMenuItem(value: "Actif", child: Text("Actif")),
                DropdownMenuItem(value: "Inactif", child: Text("Inactif")),
              ],
              onChanged: (value) => setState(() => _status = value!),
            ),
          ),
          const SizedBox(height: 20),
          label("Image"),
          GestureDetector(
            onTap: () {
              setState(() {
                _imagePath =
                    "image_exemple.png"; // Simule une sélection d'image
              });
            },
            child: InputDecorator(
              decoration: inputStyle("").copyWith(
                errorText: imageError,
              ),
              child: Text(
                _imagePath ?? "Choisir une image",
                style: TextStyle(
                  color: imageError != null ? Colors.redAccent : Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          warningBox(),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _submitted = true;
                });
                final isValid = _formKey.currentState!.validate();
                final isImageValid = validateImage() == null;

                if (isValid && isImageValid) {
                  _formKey.currentState!.save();
                  widget.onSubmit
                      ?.call(_name, _description, _status, _imagePath!);
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text("Créer la catégorie",
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
