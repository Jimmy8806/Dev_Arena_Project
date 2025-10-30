import 'package:flutter/material.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _newTagController = TextEditingController();

  String _priority = 'Low';
  final List<String> _tags = ['Work', 'Personal'];

  Color getPriorityBackground(String level) {
    switch (level) {
      case 'High':
        return const Color.fromRGBO(255, 204, 203, 1);
      case 'Medium':
        return const Color.fromRGBO(255, 229, 204, 1);
      default:
        return const Color.fromRGBO(207, 247, 211, 1);
    }
  }

  Color getPriorityTextColor(String level) {
    switch (level) {
      case 'High':
        return const Color.fromRGBO(255, 59, 48, 1);
      case 'Medium':
        return const Color.fromRGBO(255, 149, 0, 1);
      default:
        return const Color.fromRGBO(52, 199, 89, 1);
    }
  }

  void _addTag() {
    final tag = _newTagController.text.trim();
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
        _newTagController.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.68,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 17),
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(9, 9, 9, 1),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'What do you want to do?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  hintText: 'e.g. Finish Design system',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(179, 179, 179, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Date',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  hintText: 'mm/dd/yyyy',
                  hintStyle: TextStyle(color: Color.fromRGBO(18, 18, 18, 1)),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Priority',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: ['Low', 'Medium', 'High'].map((level) {
                  final isSelected = _priority == level;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _priority = level),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? getPriorityBackground(level)
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            level,
                            style: TextStyle(
                              fontSize: 17,
                              color: isSelected
                                  ? getPriorityTextColor(level)
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),
              const Text(
                'Tags',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 1),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: [
                  ..._tags.map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(207, 247, 211, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(52, 199, 89, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => _removeTag(tag),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Color.fromRGBO(52, 199, 89, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(158, 158, 158, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _addTag,
                          child: const Icon(
                            Icons.add,
                            size: 18,
                            color: Color.fromRGBO(27, 31, 38, 0.72),
                          ),
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: 80,
                          child: TextField(
                            controller: _newTagController,
                            decoration: const InputDecoration(
                              hintText: 'Add Tags',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(27, 31, 38, 0.72),
                                fontWeight: FontWeight.bold,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
