const irisConfig = {
    ip_address: '127.0.0.1',
    tcp_port: 9091,
    username: 'superuser',
    password: '1234',
    namespace: 'USER'
};

const expressConfig = {
    port: 8000
}

module.exports = { 
    irisConfig: irisConfig, 
    expressConfig: expressConfig
};