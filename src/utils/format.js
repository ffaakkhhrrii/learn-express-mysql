function formatDate(){
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0'); 
    const formattedDate = `${year}-${month}-${day}`;
    return formattedDate;
}

function formatDateWithTime(){
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0'); 
    const hour = String(now.getHours()).padStart(2,'0');
    const minutes = String(now.getUTCMinutes());
    const second =  String(now.getUTCSeconds());
    const formattedDateWithTime = `${year}-${month}-${day} ${hour}:${minutes}:${second}`;
    return formattedDateWithTime;
}


module.exports = {
    formatDate,
    formatDateWithTime
}