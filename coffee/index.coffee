$.get "data/visas.csv", (csv) ->
    lines = csv.split("\r")
    countries = lines[0].split(",").map (s) ->
        s.trim().toLowerCase()
    console.log countries

    $.get "data/final-topo.json", (json) ->
        for feature in topojson.feature(json, json.objects.final).features
            name = feature.properties.NAME
            if countries.indexOf(name.trim().toLowerCase()) > -1
                console.log name.toLowerCase()