const SERVER_IP = '192.168.1.199'
const SERVER_API = 'http://192.168.1.199:4000/api'

const mqtt = require('mqtt')
const fetch = require('node-fetch');
const client = mqtt.connect(`mqtt://${SERVER_IP}`)
const child_process = require('child_process')

module.exports = {client, child_process, fetch, SERVER_API}