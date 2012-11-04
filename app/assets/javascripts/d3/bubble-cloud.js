$(document).ready(function() {

  // Regexes for search

  path = window.location.pathname

  regexs = new Object ({
    'tag': new Object ({
      'url_regex' : /\/tag\//,
    }),
    'posts': new Object ({
      'url_regex' : /\/post\//,
      'param_regex' : /[0-9]+/
    }),
    'page': new Object ({
      'url_regex' : /\/page\//,
      'param_regex' : /[0-9]+/
    }),
    'search': new Object ({
      'url_regex' : /search/
    })
  });

  url_param = "";

  if (regexs.posts.url_regex.test(path)) {
    num = path.match(regexs.posts.param_regex)[0]
    url_param = "post/" + num
  }
  else if (regexs.page.url_regex.test(path)) {
    url_param = "page/" + path.match(regexs.page.param_regex)
  }
  else if (regexs.search.url_regex.test(path)) {
    url_param = path
  }
  else if (regexs.tag.url_regex.test(path)) {
    url_param = "/keyword/" + path.replace(regexs.tag.url_regex,"");

    console.log(url_param);
  }

  // Bubble chart stuff

  var r = 370,
      format = d3.format(",d"),
      fill = "#1B9BFF"

  var bubble = d3.layout.pack()
                 .sort(null)
                 .size([r, r]);

  var vis = d3.select("#bubble-cloud")
              .append("svg")
              .attr("width", r)
              .attr("height", r)
              .attr("class", "bubble");
 
  d3.selectAll("svg").append("circle")
                 .attr("r", function(){ return r/2 })
                 .style("fill", "#333333")
                 .attr("cx", r/2)
                 .attr("cy", r/2)



  d3.json("/api/tags/" + url_param, function(json) {
    
    var node = vis.selectAll("g.node")
                  .data(bubble.nodes(classes(json))
                  .filter(function(d) { return !d.children; }))
                  .enter().append("g")
                  .attr("class", "node")
                  .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

    node.append("title")
        .text(function(d) { return d.className + ": " + format(d.value); });

    node.append("circle")
        .attr("r", function(d) { return d.r * 0.9; })
        .style("fill", fill);

    node.append("a")
        .attr("xlink:href", function(d) { return '/tag/' + d.className;})
        .append("text")
        .attr("fill", "white")
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



