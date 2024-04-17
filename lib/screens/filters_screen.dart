import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {

    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).hintColor,
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (newValue) {
        if (title.startsWith('Gl')) {
          setState(() {
            _glutenFree = newValue;
          });
        } else if (title.startsWith('La')) {
          setState(() {
            _lactoseFree = newValue;
          });
        } else if (title.startsWith('Veget')) {
          setState(() {
            _vegetarian = newValue;
          });
        } else if (title.startsWith('Vegan')) {
          setState(() {
            _vegan = newValue;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection. ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                  ),
                  _buildSwitchListTile(
                    'Lactose-Free',
                    'Only include Lactose-Free meals',
                    _lactoseFree,
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    _vegetarian,
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals',
                    _vegan,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
