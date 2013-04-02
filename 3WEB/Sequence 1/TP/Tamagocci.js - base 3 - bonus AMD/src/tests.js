requirejs.config({
  paths : {
      'tamagocci-spec' : 'spec/tamagocci-spec'
    , 'hellokitty-spec' : 'spec/hellokitty-spec'
    , 'pikachu-spec' : 'spec/pikachu-spec'
    , 'tamagocci' : 'lib/tamagocci/tamagocci'
    , 'hellokitty' : 'lib/tamagocci/hellokitty'
    , 'pikachu' : 'lib/tamagocci/pikachu'
  }
});


requirejs(['tamagocci-spec', 'hellokitty-spec', 'pikachu-spec'], function() {

  var jasmineEnv = jasmine.getEnv();
  jasmineEnv.updateInterval = 1000;

  var htmlReporter = new jasmine.HtmlReporter();

  jasmineEnv.addReporter(htmlReporter);

  jasmineEnv.specFilter = function(spec) {
    return htmlReporter.specFilter(spec);
  };
  
  execJasmine();

  function execJasmine() {
    jasmineEnv.execute();
  }

});