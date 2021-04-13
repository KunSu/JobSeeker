import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jobseeker/models/models.dart';
import 'package:jobseeker/service/map_service.dart';

class SearchResultsView extends StatefulWidget {
  final String searchTerm;

  const SearchResultsView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  _SearchResultsViewState createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView> {
  List<Result> results;
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    results = await MapService().getNearBySearch(
      searchTerm: widget.searchTerm,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }
    return TabBarView(
      children: [
        ApplicationMapView(searchTerm: widget.searchTerm),
        ApplicationListView(searchTerm: widget.searchTerm),
      ],
    );
  }
}

class ApplicationMapView extends StatefulWidget {
  ApplicationMapView({Key key, this.searchTerm}) : super(key: key);

  final String searchTerm;
  @override
  _ApplicationMapViewState createState() => _ApplicationMapViewState();
}

class _ApplicationMapViewState extends State<ApplicationMapView> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final results = await MapService().getNearBySearch(
      searchTerm: widget.searchTerm,
    );

    setState(() {
      _markers.clear();
      for (final result in results) {
        final position = result.geometry.location;
        final marker = Marker(
          markerId: MarkerId(result.name),
          position: LatLng(position.lat, position.lng),
          infoWindow: InfoWindow(
            title: result.name,
            snippet: result.vicinity,
          ),
        );
        _markers[result.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // _onUpdated();
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: const LatLng(37.395389, -121.868306),
        zoom: 14,
      ),
      markers: _markers.values.toSet(),
    );
  }
}

class ApplicationListView extends StatefulWidget {
  ApplicationListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);
  final String searchTerm;

  @override
  _ApplicationListViewState createState() => _ApplicationListViewState();
}

class _ApplicationListViewState extends State<ApplicationListView> {
  List<Result> results = [];
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    results = await MapService().getNearBySearch(
      searchTerm: widget.searchTerm,
    );
  }

  @override
  Widget build(BuildContext context) {
    results.removeWhere((item) => item.rating == null);
    results.sort((a, b) => b.rating.compareTo(a.rating));
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          subtitle: Text('Rating: ${results[index].rating.toString()}'),
        );
      },
    );
  }
}
