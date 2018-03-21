var url1 = "http://192.168.0.100/api/87AHIgH0k5JNqFEg94uajlLeLrHdskFYjdNBsLWu/lights/11/state";
var url2 = "http://192.168.0.100/api/87AHIgH0k5JNqFEg94uajlLeLrHdskFYjdNBsLWu/lights/12/state";
var url3 = "http://192.168.0.100/api/87AHIgH0k5JNqFEg94uajlLeLrHdskFYjdNBsLWu/lights/13/state";

var hue = 0

setInterval(function() {
  hue = (hue + 3000) % 65536;
  fetch(url1, {
    method: 'PUT', // or 'PUT'
    body: JSON.stringify({"on":true, "sat":254, "bri":254,"hue": hue}),
  }).then(res => res.json())
    .catch(error => console.error('Error:', error))
    .then(response => console.log('Success:', response));
  fetch(url2, {
    method: 'PUT', // or 'PUT'
    body: JSON.stringify({"on":true, "sat":254, "bri":254,"hue": hue}),
  }).then(res => res.json())
    .catch(error => console.error('Error:', error))
    .then(response => console.log('Success:', response));
  fetch(url3, {
    method: 'PUT', // or 'PUT'
    body: JSON.stringify({"on":true, "sat":254, "bri":254,"hue": hue}),
  }).then(res => res.json())
    .catch(error => console.error('Error:', error))
    .then(response => console.log('Success:', response));
}, 100)
