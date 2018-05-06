function buildPlot() {
    /* data route */
    var url = "/names";
    Plotly.d3.json(url, function(error, response) {

        console.log(response);

        var data = [response]

        var layout = {
            title: "Belly Button",
            xaxis: {
                title: "OTU ID"
            },
            
        };

        Plotly.newPlot("plot", data, layout);
    });
}

buildPlot();
