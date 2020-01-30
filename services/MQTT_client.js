const {client, child_process} = require("../config/index.js")

client.on('connect', ()=>{
    client.subscribe('paymentSucceeded')
    client.subscribe('paymentCanceled')
    client.subscribe('paymentRefunded')
    client.subscribe('paymentFailed')
})

client.on('message', (topic,payload)=>{
    const user = JSON.parse(payload.toString())

    if(topic === 'paymentSucceeded'){
        addUser()
    }
    else{
        removeUser()
    }
    
    
    // workerProcess.stderr.on('data',(data)=>{
    //     console.log('stderr: ', data.toString())
    // })
})


function addUser(){
    child_process.spawn('/bin/sh', [process.pwd()+'/addUserScript.sh', user.email, user.password])
}
function removeUser(){
    child_process.spawn('/bin/sh', [process.pwd()+'/removeUserScript.sh', user.email])
}