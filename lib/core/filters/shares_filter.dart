enum ShareOrdering {
  desc,
  asc,
  mostInteractive,
  mostViewed,
}

class SharesFilter {
  SharesFilter({
    this.ordering = ShareOrdering.desc,
  });

  final ShareOrdering ordering;

  SharesFilter copyWith({
    ShareOrdering? ordering,
  }) {
    return SharesFilter(
      ordering: ordering ?? this.ordering,
    );
  }

  Map<String, String> toMap() {
    switch (ordering) {
      case ShareOrdering.desc:
        return {'sort': 'desc'};
      case ShareOrdering.asc:
        return {'sort': 'asc'};
      case ShareOrdering.mostInteractive:
        return {'reviews_count': 'reviews'};
      case ShareOrdering.mostViewed:
        return {'views': 'views'};
    }
    return {};
  }
}//by country