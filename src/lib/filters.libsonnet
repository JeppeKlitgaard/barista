local filterHitsByTriggers = function(hits, filterTriggers)
    local filteredHits = [
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

    std.prune(filteredHits);

local stripTriggers = function(hits, triggersToStrip)
    local filteredHits = [
        {
            [key]: if key == "triggers"
                then [
                    trigger
                    for trigger in hit[key]
                    if !std.member(triggersToStrip, trigger)
                ] else hit[key]

            for key in std.objectFields(hit)
        }

        for hit in hits
    ];

    filteredHits;

{
    filterHitsByTriggers: filterHitsByTriggers,
    stripTriggers: stripTriggers,
}