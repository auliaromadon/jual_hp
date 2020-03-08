const mysql = require('mysql');
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');

const connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : '',
	database : 'jual_hp'
});

const app = express();
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

//mencocokkan username dan password yang ada di database
app.post('/auth', function(request, response) {
	const username = request.body.username;
	const password = request.body.password;
	if (username && password) {
		connection.query('SELECT * FROM samsung WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('/samsung');
			} else {
				response.send('Username dan/atau Password salah!');
			}			
			response.end();
		});
	} else {
		response.send('Masukkan Username and Password!');
		response.end();
	}
});

app.get('/samsung', function(request, response) {
	if (request.session.loggedin) {
		response.send('Selamat Datang, ' + request.session.username + '!' + 'masuk ke endpoint HKHS');
	} else {
		response.send('Mohon login terlebih dahulu!');
	}
	response.end();
});

app.get('/hkhs', (req, res) => {
    let sql = "SELECT * FROM samsung_brg";
    let query = connection.query(sql, (err, results) => {
        if(err) throw err;
        res.send(JSON.stringify({ "response": results}));
    });
});

app.post('/hkhs', (req,res) => {
    let data = {type: req.body.type, spesifikasi: req.body.spesifikasi, warna: req.body.warna, harga: req.body.harga, stok: req.body.stok};
    let sql = "INSERT INTO samsung_brg SET ?";
    let query = connection.query(sql, data,(err) => {
        if (err) throw err;
        res.send(JSON.stringify({"response": '   BERHASIL MENAMBAHKAN DATA !'}));
    });
});

app.put('/hkhs/:id',(req, res) => {
    let sql = "UPDATE samsung_brg SET type='"+req.body.type+"', spesifikasi='"+req.body.spesifikasi+"', warna='"+req.body.warna+"', harga='"+req.body.harga+"', stok='"+req.body.stok+"' WHERE id="+req.params.id;
    let query = connection.query(sql, (err) => {
        if(err) throw err;
        res.send(JSON.stringify({"response": 'BERHASIL EDIT'}));
    });
});

app.delete('/hkhs/:id', (req, res) => {
    let sql = "DELETE FROM samsung_brg WHERE id="+req.params.id+"";
    let query = connection.query(sql, (err) => {
        if(err) throw err;
        res.send(JSON.stringify({ "response": 'KEHAPUS NIH!'}));
    });
});

//mencocokkan username dan password yang ada di database
app.post('/authi', function(request, response) {
	const username = request.body.username;
	const password = request.body.password;
	if (username && password) {
		connection.query('SELECT * FROM iphone WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('/iphone');
			} else {
				response.send('Username dan/atau Password salah!');
			}			
			response.end();
		});
	} else {
		response.send('Masukkan Username and Password!');
		response.end();
	}
});

app.get('/iphone', function(request, response) {
	if (request.session.loggedin) {
		response.send('Selamat Datang, ' + request.session.username + '!' + 'masuk ke endpoint HKHI');
	} else {
		response.send('Mohon login terlebih dahulu!');
	}
	response.end();
});

app.get('/hkhi', (req, res) => {
    let sql = "SELECT * FROM iphone_brg";
    let query = connection.query(sql, (err, results) => {
        if(err) throw err;
        res.send(JSON.stringify({ "response": results}));
    });
});

app.post('/hkhi', (req,res) => {
    let data = {type: req.body.type, spesifikasi: req.body.spesifikasi, warna: req.body.warna, harga: req.body.harga, stok: req.body.stok};
    let sql = "INSERT INTO iphone_brg SET ?";
    let query = connection.query(sql, data,(err) => {
        if (err) throw err;
        res.send(JSON.stringify({"response": '   BERHASIL MENAMBAHKAN DATA !'}));
    });
});

app.put('/hkhi/:id',(req, res) => {
    let sql = "UPDATE iphone_brg SET type='"+req.body.type+"', spesifikasi='"+req.body.spesifikasi+"', warna='"+req.body.warna+"', harga='"+req.body.harga+"', stok='"+req.body.stok+"' WHERE id="+req.params.id;
    let query = connection.query(sql, (err) => {
        if(err) throw err;
        res.send(JSON.stringify({"response": 'BERHASIL EDIT'}));
    });
});

app.delete('/hkhi/:id', (req, res) => {
    let sql = "DELETE FROM iphone_brg WHERE id="+req.params.id+"";
    let query = connection.query(sql, (err) => {
        if(err) throw err;
        res.send(JSON.stringify({ "response": 'KEHAPUS NIH!'}));
    });
});

app.listen(5000)