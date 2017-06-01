function startDateShort() {
    var f = new Date();
    document.getElementById('lbl_fecha').innerHTML = f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear();
}

function startTime() {
    today = new Date();
    h = today.getHours();
    m = today.getMinutes();
    s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('lbl_hora').innerHTML = h + ":" + m + ":" + s;
    t = setTimeout('startTime()', 500);
}

function checkTime(i)
{ if (i < 10) { i = "0" + i; } return i; }



window.onload = function () { startDateShort(); startTime(); }