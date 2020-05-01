'use strict';

const express = require('express');

const host = '0.0.0.0';
const port = 8080;
const greeterName = process.env.GREETER_NAME || 'Gallus Anonymus';

const app = express();

app.get('/', (req, res) => {
    res.send(`Hello, stranger! My name is ${greeterName}.`);
});

app.listen(port, host, () => {
    console.log(`Running on http://${host}:${port}`);
});