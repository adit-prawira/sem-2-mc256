function isDanger = danger_range(range1, range2, range3, range4, range5, range6, range7)
    isDanger= range1 < 0.5 || range2 < 0.5 || range3 < 0.5 || ...
        range4 < 0.5|| range5 < 0.5|| range6 < 0.5 || range7 < 0.5;
end
