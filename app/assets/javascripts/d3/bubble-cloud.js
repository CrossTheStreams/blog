$(document).ready(function() {

      
  var r = 350,
      format = d3.format(",d"),
      fill = "#08C"

  var bubble = d3.layout.pack()
                 .sort(null)
                 .size([r, r]);

  var vis = d3.select("#bubble-cloud")
              .append("svg")
              .attr("width", r)
              .attr("height", r)
              .attr("class", "bubble");

  d3.json("/bubble-data.json", function(json) {
    
    var node = vis.selectAll("g.node")
                  .data(bubble.nodes(classes(json))
                  .filter(function(d) { return !d.children; }))
                  .enter().append("g")
                  .attr("class", "node")
                  .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

    node.append("title")
        .text(function(d) { return d.className + ": " + format(d.value); });

    node.append("circle")
        .attr("r", function(d) { return d.r - 4; })
        .style("fill", fill);

    node.append("text")
        .attr("text-anchor", "middle")
        .attr("dy", ".5em")
        .text(function(d) { return d.className.substring(0, d.r); });

  });

  // Returns a flattened hierarchy containing all leaf nodes under the root.
  function classes(root) {

    var classes = [];

    function recurse(keyword, node) {
      if (node.children) node.children.forEach(function(child) {
        recurse(node.keyword, child);
      });
      else classes.push({packageName: keyword, 
                         className: node.keyword, 
                         value: node.count});
    }

    recurse(null, root);
    return {children: classes};
  }


});



