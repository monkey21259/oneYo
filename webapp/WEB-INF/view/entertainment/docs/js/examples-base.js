$(document).ready(function() {
    $("code.snippet").each(function(i, e) {
        try {
            hljs.highlightBlock(e);
        } catch(ignored) {};
    });

    $("#wrap")[0] && $(window).on("load", function() {
        window.setTimeout(function() {
            if (window.map && window.naver && window.naver.maps && map instanceof naver.maps.Map) {
                var mapModel = map.getMapModel(),
                    mapView = map.getMapView(),
                    mapHeight = parseInt(mapView.get("mapDiv").style.height, 10) || 400;

                $(window).on("resize", function() {
                    var wrapper = $("#wrap");

                    wrapper.length && map.setSize(new naver.maps.Size(wrapper.width(), mapHeight));
                });
            }
        }, 0);
    });

    var snippetEl = $("#snippet"),
        codeEl = $("#code");

    if (snippetEl.length && codeEl.length) {
        var pre = $("<pre></pre>"),
            html = codeEl.text() || codeEl.html();

        pre.text(html);

        snippetEl.append(pre);
    }

    $("code.snippet").each(function(i, e) {
        try {
            hljs.highlightBlock(e);
        } catch(ignored) {};
    });
});
