function s = histogramIntersection(h1,h2)
    h1 = h1 / sum(h1);
    h2 = h2 / sum(h2);

    s = sum(min(h1,h2));
end