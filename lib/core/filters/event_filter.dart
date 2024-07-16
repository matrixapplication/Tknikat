enum EventOrdering {
  start,
  end,
  expired,
}

extension OrderingEx on EventOrdering {
  String get name {
    switch (this) {
      case EventOrdering.start:
        return 'start_date';
      case EventOrdering.end:
        return 'end_date';
      case EventOrdering.expired:
        return 'expired';
    }
  }
}

class EventsFilter {
  EventsFilter({
    this.ordering = EventOrdering.start,
    this.searchText,
  });

  final EventOrdering ordering;
  final String? searchText;

  Map<String, dynamic> toMap() {
    return {
      'sort': ordering.name,
      'search': searchText,
    };
  }

  EventsFilter copyWith({
    EventOrdering? ordering,
    String? searchText,
  }) {
    return EventsFilter(
      ordering: ordering ?? this.ordering,
      searchText: searchText ?? this.searchText,
    );
  }
}
