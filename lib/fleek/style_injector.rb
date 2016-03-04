module Fleek
  module StyleInjector
    def stylesheet_link_tag(*sources)
      options = sources.extract_options!.stringify_keys
      sources.map { |source|
        options['original_source'] = source
        options['debug'] = false
        super source, options
      }.join("\n").html_safe + javascript_tag do
        <<-JS.html_safe
(function(){
var ws = new WebSocket((location.protocol === "https:" ? "wss:" : "ws:") + "//" + location.host + "/.fleek-connection");
ws.onopen = function() {
  ws.send(JSON.stringify({
    "identifier": "register_assets",
    "assets": #{sources.to_json},
  }));
};
ws.onmessage = function(event) {
  var msg = JSON.parse(event.data);
  if (msg.identifier == 'asset_updated') {
    document.querySelector("link[original_source='" + msg.asset + "']").href = msg.new_url;
  }
};
})();
      JS
      end
    end
  end
end
