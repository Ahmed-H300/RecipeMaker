import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filters';

  final Function saveFilter;
  Map<String, bool> currentfilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  FilterScreen(this.currentfilters, this.saveFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentfilters['gluten']!;
    _lactoseFree = widget.currentfilters['lactose']!;
    _vegan = widget.currentfilters['vegan']!;
    _vegetarian = widget.currentfilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _lactoseFree,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilter(selectedFilters);
              },
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    title: const Text('Gluten-Free'),
                    subtitle: const Text('Only include gluten-Free Meals'),
                    value: _glutenFree,
                    onChanged: (Value) {
                      setState(() {
                        _glutenFree = Value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Lactose-Free'),
                    subtitle: const Text('Only include Lactose-Free Meals'),
                    value: _lactoseFree,
                    onChanged: (Value) {
                      setState(() {
                        _lactoseFree = Value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegetarian-Free'),
                    subtitle: const Text('Only include Vegetarian-Free Meals'),
                    value: _vegetarian,
                    onChanged: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegan-Free'),
                    subtitle: const Text('Only include Vegan-Free Meals'),
                    value: _vegan,
                    onChanged: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
