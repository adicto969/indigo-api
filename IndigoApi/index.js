const express = require('express');
const logger = require('morgan');
const bodyParser = require('body-parser');
const app = express();

const users = require('./routes/users');
const currencies = require('./routes/currencies');
const userTypes = require('./routes/user-types');
const sponsors = require('./routes/sponsors');
const companies = require('./routes/companies');
const products = require('./routes/products');
const testModels = require('./routes/test-models');
const tests = require('./routes/tests');
const testQuestions= require('./routes/test-questions');

var jwt = require('jsonwebtoken');

app.set('secretKey', 'ClaveSecreta');


app.use(logger('dev'));
app.use(bodyParser.json({extended: false}));
app.get('/', function(req, res){
    res.json({"tutorial" : "Construyendo una API REST con NodeJS"});
});

app.use('/users', users);
app.use('/currencies', currencies);
app.use('/usertypes', userTypes);
app.use('/sponsors', sponsors);
app.use('/companies', companies);
app.use('/products', products);
app.use('/testmodels', testModels);
app.use('/tests', tests);
app.use('/testquestions', testQuestions);
//app.use('/monedas', validateUser, monedas);

app.get('/favicon.ico', function (req, res) {
    res.sendStatus(204);
});

function validateUser(req, res, next){
    jwt.verify(req.headers['x-access-token'], req.app.get('secretKey'), function(err, decoded){
        if (err)
            res.json({status: "error", message: err.message, data: null});
        else{
            req.body.userId = decoded.Id;
            next();
        }
    });
}

app.use(function(req, res, next){
    let err = new Error('Not Found');
    err.status = 404;
    next(err);
});

app.use(function(err, req, res, next){
    console.log(err);

    if (err.status == 404)
        res.status(404).json({message: "Not found"});
    else
        res.status(500).json({message: "Error interno en el servidor"});
});

app.listen(3000, function(){ console.log('El servidor ha sido inicializado: http://localhost:3000');}); 