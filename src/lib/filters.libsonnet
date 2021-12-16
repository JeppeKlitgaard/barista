local filterHitsByTriggers = function(hits, filterTriggers)
    local filteredMatches = [
        local filterCriterions = [
            std.member(hit.triggers, filterTrigger)

            for filterTrigger in filterTriggers
        ];

        local shouldFilter = std.member(filterCriterions, true);

        if shouldFilter
            then null
            else hit

        for hit in hits
    ];

    std.prune(filteredMatches);

{
    filterHitsByTriggers: filterHitsByTriggers,
}