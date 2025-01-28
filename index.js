const express = require('express');
const bodyParser = require('body-parser');
const path = require('path')
require('dotenv').config();
const db = require('./db');

const fileupload = require('express-fileupload');

// const multer = require('multer')
// const upload = multer({dest: 'uploads/'})


const app = express();
const port = 3000;

app.set('views', `${__dirname}/static`);
app.set('view engine','ejs');


app.use(fileupload());
app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

let root_path = path.resolve(__dirname, 'static')

app.use(express.static(root_path));

const findRoutes = require('./router/database');
const memberRoutes = require('./router/member');

app.use('/database', findRoutes);
app.use('/member', memberRoutes);

app.get('/', (req, res) => {
    
    // res.render('homepage');
    res.redirect('member/login');
});

// app.post('/upload', (req, res) => {
//     res.json({ meesage: 'Hello pk'})
// })

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});