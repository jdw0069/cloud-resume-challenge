let options = {
method: 'PUT',
mode: "cors",
headers: {
    'Content-Type': 'application/json',
},
}

window.addEventListener('load', function(){
    fetch('https://wsuj5gj0k1.execute-api.us-east-1.amazonaws.com/test', options)
    .then((response) => response.json())
    .then((data) => 
    document.getElementById("page-count").innerHTML = data.body.slice(1,-1));
  
})

